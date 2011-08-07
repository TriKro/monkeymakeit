require 'spec_helper'

describe User do
  describe 'validations' do
    before(:all) do
      Factory.create(:user)
    end

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
  end

  describe "has unique invite codes" do
    before(:each) do
      @user = Factory.create(:user, :invite_code => nil)
    end

    it "should generate an invite code after being created" do
      @user.reload.invite_code.should_not be_nil
    end

    it "should not regenerate the invite code after being updated" do
      old_invite_code = @user.reload.invite_code
      @user.update_attribute(:email, Factory.next(:email))
      @user.reload.invite_code.should == old_invite_code
    end
  end
end
