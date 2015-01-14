class SkillBookGroup < ActiveRecord::Base
  default_scope { where(:published => true).order(:name) }
  has_many :skills
  has_many :skill_books
end