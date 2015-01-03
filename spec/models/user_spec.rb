require 'rails_helper'

RSpec.describe User, :type => :model do

  it { should validate_presence_of(:email) }

  context "create" do
    before(:each) do
      @user = FactoryGirl.build(:user)
    end

    it "doesn't send a confirmation email" do
      expect { @user.save! }.not_to change { ActionMailer::Base.deliveries.count }
    end
  end
end
