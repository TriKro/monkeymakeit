class FeedbackMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :sender_email, :content, :recipient_name, :recipient_email, :subject

  #validates_format_of :sender_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i
  #validates_length_of :content, :minimum => 10

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def recipient
    if recipient_name
      recipient_name + " <" + recipient_email + ">"
    else
      recipient_email
    end
  end

end