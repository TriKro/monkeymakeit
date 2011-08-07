require 'spec_helper'

describe RegistrationsController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  describe "GET new" do
    before(:each) do
      @invite_code = Factory.next(:invite_code)
    end

    it "saves the invite code in the session" do
      get :new, :invite_code => @invite_code
      session[:invite_code].should be(@invite_code)
    end
  end

  describe "POST create" do
    describe "with a valid email address" do
      before(:each) do
        @past_user = Factory.create(:user)
        @invite_code = @past_user.invite_code
        @email = Factory.next(:email)
        User.stub(:new).with("email" => @email) do
          mock_user(:save => true, :email => @email)
        end
      end

      it "saves who the user was invited by, if they were invited by someone" do
        mock_user.should_receive(:invited_by=).with(@invite_code)
        post :create, {:user => {:email => @email}}, {:invite_code => @invite_code}
      end

      it "does not save the user as invited by anyone, if they weren't" do
        mock_user.should_not_receive(:invited_by=)
        post :create, {:user => {:email => @email}}
      end

      it "does not save the user as invited by anyone, given an invalid code" do
        mock_user.should_not_receive(:invited_by=)
        post :create, {:user => {:email => @email}}, {:invite_code => "invalid"}
      end
    end
  end
end
