class UserSweeper < ActionController::Caching::Sweeper

  observe User

  def after_create(user)
    auth = user.authentications.provider if !user.authentications.blank?
    km.record('signed up', { 'provider' => auth, 'url' => request.referer.split("?")[0] })
    km.identify(user.email) if !user.email.nil?
  end

  def after_validation(user)
    km.identify(user.email) if user.email_changed? && !user.email.nil?
  end

end