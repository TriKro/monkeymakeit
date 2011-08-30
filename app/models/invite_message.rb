class InviteMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :from, :recipients, :subject, :content, :invite_link

  validates_presence_of :from
  validates_presence_of :invite_link
  validates_presence_of :recipients
  validate :recipients_should_contain_valid_emails
  validates_format_of :from, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i
  validates_presence_of :subject
  validates_presence_of :content
  validates_length_of :content, :minimum => 10
  validate :content_should_contain_invite_link

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def recipients_should_contain_valid_emails
    if !recipients.nil?
      recipients.split(',').each do |recipient|
        errors.add(:recipients, "is not formatted correctly") unless recipient.strip =~ /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i
      end
    end
  end

  def content_should_contain_invite_link
    if !invite_link.nil?
      unless content.include? invite_link
        errors.add(:content, "must contain invite link")
      end
    end
  end

end