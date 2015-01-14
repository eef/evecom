class Skill < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill_book
  belongs_to :skill_book_group
  has_many :attrs, :foreign_key => :market_item_id, :primary_key => :skill_book_id
end
