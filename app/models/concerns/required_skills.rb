module RequiredSkills

  def required_skill_types
    skills = []
    req_attrs = self.attrs.where("attr_type_id in (182, 183, 184)")
    req_attrs.each do |ra|
      if ra.value_int.nil?
        id = ra.value_float.to_i
      else
        id = ra.value_int
      end
      if @json
        skills << SkillBook.find(id).name.downcase.gsub(" ", "-")
      else
        skills << SkillBook.find(id)
      end
    end
    skills
  end

  def required_skill_levels
    levels = []
    required_skill_levels = self.attrs.where("attr_type_id in (277, 278, 279)")
    required_skill_levels.each do |rl|
      if rl.value_int.nil?
        level = rl.value_float.to_i
      else
        level = rl.value_int
      end
      levels << level
    end
    levels
  end

  def required_skills(json = false)
    @json = json
    skills = required_skill_types
    levels = required_skill_levels
    ret = Hash[*skills.zip(levels).flatten]
    ret
  end

end
