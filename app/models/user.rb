class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  before_create :generate_uid
  has_many :characters

  def generate_uid
    self.uid = self.email
    skip_confirmation!
  end
end
