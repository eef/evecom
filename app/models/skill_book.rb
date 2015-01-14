class SkillBook < ActiveRecord::Base
  include RequiredSkills
  default_scope { where(:published => true).order(:name) }
  belongs_to :skill_book_group
  has_many :attrs, :foreign_key => :market_item_id

  def sp_for_level(level = 0)
    all_levels = [1,2,3,4,5]
    values = []
    all_levels.each do |l|
      power = (2.5 * l) - 2.5
      values[l] = (2 ** power) * 250 * self.rank
    end
    if level == 0
      values
    elsif level > 0
      values[level].ceil
    end
  end

end
