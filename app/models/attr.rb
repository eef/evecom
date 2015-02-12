class Attr < ActiveRecord::Base

  belongs_to :attr_type
  belongs_to :market_item

end
