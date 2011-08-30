class SubscriptionObserver < ActiveRecord::Observer

  def after_create(subscription)
    UserMailer.new_subscriber_email(subscription).deliver
    UserMailer.new_subscription_email(subscription).deliver
  end

end