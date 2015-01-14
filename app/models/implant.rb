class Implant < ActiveRecord::Base
  belongs_to :character
  belongs_to :market_item

  before_create :set_modifier_and_name
  
  
  private
  def set_modifier_and_name
    self.name = self.market_item.name
    self.market_item.attrs.each do |attr|
      if !!(/modifier/i =~ attr.attr_type.display_name) and attr.value_int > 0
        self.value = attr.value_int
        self.implant_type = attr.attr_type.name.gsub("Bonus", "")
      end
    end
  end

end
