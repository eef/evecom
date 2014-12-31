require 'rails_helper'

RSpec.describe User, :type => :model do
  context "create" do
    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "doesn't send a confirmation email" do
      expect { @user.save! }.not_to change { ActionMailer::Base.deliveries.count }
    end
  end
end
