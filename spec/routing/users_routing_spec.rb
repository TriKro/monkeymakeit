require "spec_helper"

describe UsersController do
  describe "routing" do
    it "recognizes and generates #create" do
      { :post => "/users" }.should
        route_to(:controller => "users", :action => "create")
    end

    it "recognizes and generates #new" do
      invite_code = Factory.next(:invite_code)
      { :get => "/#{invite_code}" }.should
        route_to(:controller => "users", :action => "new")
    end

    it "recognizes and generates #invite_email" do
      { :post => "/users/invite_email" }.should
        route_to(:controller => "users", :action => "invite_email")
    end
  end
end
