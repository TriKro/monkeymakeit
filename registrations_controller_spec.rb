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

  describe "POST invite_email" do
    def valid_email_args(opts={})
      invite_link = opts.delete(:invite_link) if opts[:invite_link]
      invite_link ||= invite_link_url(Factory.next(:invite_code))
      { :from => Factory.next(:email),
        :to => Factory.next(:email),
        :message => "Check out this service: #{invite_link}",
        :invite_link => invite_link }.merge(opts)
    end

    before(:each) do
      User.should_receive(:where).with(:email => session[:signed_up_email]) do
        [ mock_user ]
      end
    end

    after(:each) do
      # we will render the create view on error & success, so we need @user
      response.should render_template("create")
      assigns(:user).should be_an_instance_of(User)
    end

    describe "with invalid params" do
      before(:each) do
        SignupMailer.should_not_receive(:invite_email)
      end

      after(:each) do
        flash[:error].should_not be_empty
      end

      it "needs email parameters" do
        post :invite_email
      end

      it "needs an email addresses to send from" do
        post :invite_email, :email => valid_email_args(:from => '')
      end

      it "needs an email addresses to send to" do
        post :invite_email, :email => valid_email_args(:to => '')
      end

      it "needs an email message" do
        post :invite_email, :email => valid_email_args(:message => '')
      end

      it "needs an invite link" do
        post :invite_email, :email => valid_email_args(:invite_link => '')
      end

      it "needs the email message to include the invite link" do
        post :invite_email, :email => valid_email_args(:message => "Hi")
      end
    end

    describe "with valid params" do
      it "sends an email" do
        mailer_double = double("mailer")
        mailer_double.should_receive(:deliver)
        SignupMailer.should_receive(:invite_email).and_return(mailer_double)
        post :invite_email, :email => valid_email_args
      end

      it "should notify the user that the email has been sent" do
        post :invite_email, :email => valid_email_args
        flash[:notice].should_not be_empty
      end
    end
  end
end
