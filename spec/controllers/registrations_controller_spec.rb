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
end
