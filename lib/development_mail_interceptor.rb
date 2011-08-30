class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "[TEST email to #{message.to}] #{message.subject}"
    message.to = "dev@monkeymake.it"
  end
end