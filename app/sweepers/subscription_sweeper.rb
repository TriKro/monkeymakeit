class SubscriptionSweeper < ActionController::Caching::Sweeper

  observe Subscription

  def after_create(subscription)
    km.record('activity', { 'type' => 'subscribed', 'story' => subscription.story.title, 'author' => subscription.story.author.identifier, 'subscriber' => subscription.user.identifier, 'url' => request.referer.split("?")[0] })
  end

end