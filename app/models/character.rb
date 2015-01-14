class Character < ActiveRecord::Base

  belongs_to :user
  has_many :implants, :dependent => :destroy
  has_many :traits, :dependent => :destroy
  has_many :skills, :dependent => :destroy

  serialize :skill_attributes, Hash

  before_create :create_implants, :create_skills, :create_traits
  before_update :update_skills, :update_implants

  TRAITS = ['intelligence', 'willpower', 'charisma', 'perception', 'memory']

  def eve_api
    begin
      api = ActionEve::API.new(:id => self.api_id, :vcode => self.api_vcode)
      user = api.users.first
      user.find_character(self.character_id.to_i)
    rescue ActionEve::Exceptions::BaseException

    end
  end

  def activate
    active = Character.where(active: true).first
    active.update_attribute(:active, false) unless active.nil?
    self.update_attribute(:active, true)
  end

  def self.active_character
    where(active: true).first
  end

  def active_attributes
    self.as_json.merge(skill_queue: skill_queue)
  end

  def update_character_sheet
    @update_character_sheet || true
  end

  def current_ship
    MarketItem.find(self.ship_type_id)
  end

  def attribute_points
    ret = {}
    traits = self.traits.first
    TRAITS.each do |trait_name|
      ret[trait_name] = {}
      implant = check_and_build_implant(trait_name)
      ret[trait_name][:base] = ret[trait_name][:total]  = traits.send(trait_name)
      unless implant.empty?
        ret[trait_name][:implant] = implant
        ret[trait_name][:total] += implant[:modifier]
      end
    end
    ret
  end

  def skill_queue
    queue = self.eve_api.skill_queue
    items = queue[:items]
    # self.create_or_update_queue_email(items.last) unless items.blank?
    queue[:group_ids] = {}
    training_skill = {}
    training_skill = {SkillBook.find(queue[:currently_training]).skill_book_group_id => queue[:currently_training]} if !items.empty?
    queue[:currently_training] = training_skill
    items.each do |item|
      sk = self.skills.find_by_skill_book_id(item[:skill])
      if sk.nil?
        sk = SkillBook.find(item[:skill])
      end
      unless sk.nil?
        group_id = sk.skill_book_group_id
        item[:skill] = sk
        if queue[:group_ids].has_key?(group_id)
          queue[:group_ids][group_id] += 1
        elsif !queue[:group_ids].has_key?(group_id)
          queue[:group_ids][group_id] = 1
        end
      end
      item[:name] = sk.name
    end
    queue[:items] = items
    queue
  end

  def sp_per(time_scale, pa, sa)
    pa = self.attribute_points[pa][:total].to_f
    sa = self.attribute_points[sa][:total].to_f
    ret = case time_scale
            when "minute" then ret = pa + (sa / 2)
            when "hour" then ret = ((pa + (sa / 2)) * 60) - 1
            when "second" then ret = ((pa + (sa / 2)) / 60).to_f
          end
    ret
  end

  def check_and_build_implant(name)
    ret = {}
    implant = self.implants.where(:implant_type => name).first
    unless implant.blank?
      ret = {:name => implant.name, :modifier => implant.value}
    end
    ret
  end

  private

  def create_implants
    implants = self.eve_api.implants
    puts implants.inspect
    implants.each {|implant| self.implants.build(implant) }
  end

  def update_implants
    if @update_character_sheet
      implants = self.eve_api.implants
      self.implants.clear
      implants.each {|implant| self.implants.build(implant) }
    end
  end


  def create_traits
    self.traits.build(self.eve_api.traits)
  end

  def create_skills
    skills = self.eve_api.skills
    skills.each do |skill|
      skill_book = SkillBook.find(skill.type_id)
      self.skills.build(name: skill_book.name, skill_book_id: skill.type_id, skill_points: skill.skill_points, level: skill.level, skill_book_group: skill_book.skill_book_group)
    end
  end

  def update_skills
    if @update_character_sheet
      skills = self.eve_api.skills
      skills.each do |skill|
        if self.skills.where(:skill_book_id => skill.type_id).exists?
          sk = self.skills.where(:skill_book_id => skill.type_id).first
          sk.skill_points = skill.skill_points
          sk.level = skill.level
          sk.save
        else
          self.skills.build(:skill_book_id => skill.type_id, :skill_points => skill.skill_points, :level => skill.level, :skill_book_group => SkillBook.find(skill.type_id).skill_book_group)
        end
      end
    end
  end

end
