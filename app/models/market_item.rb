class MarketItem < ActiveRecord::Base

  has_many :implants
  has_many :attrs

end
