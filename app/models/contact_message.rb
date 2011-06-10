class ContactMessage

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :sender_name, :sender_email, :subject, :content, :recipient_name, :recipient_email

  validates_presence_of :sender_name
  validates_format_of :sender_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :subject
  validates_length_of :content, :maximum => 500, :minimum => 10

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def sender
    sender_name + " <" + sender_email + ">"
  end

  def recipient
    recipient_name + " <" + recipient_email + ">"
  end

end