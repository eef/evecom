class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  before_save :generate_uid

  def generate_uid
    self.uid = self.email
    skip_confirmation!
  end
end
