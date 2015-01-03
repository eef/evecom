class Character < ActiveRecord::Base

  serialize :skill_attributes, Hash

end
