require_dependency File.dirname(__FILE__) + '/../../config/initializers/diff_lcs'
require_dependency File.dirname(__FILE__) + '/../../config/initializers/string'
require_dependency 'html_page'

class Suggestion < ActiveRecord::Base

  validates :before_html, :presence => true

  validates_format_of :email, :allow_blank => true, :with => /^[-a-z0-9_+\.]+@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  default_scope :order => "created_at DESC"

  after_initialize :generate_text_version

  def generate_text_version
    self.before_text ||= HtmlPage.new(before_html, url).to_text
    self.after_text ||= self.before_text
  end

  def html_diff_with_original
    Diff::LCS::HtmlDiff.html_diff_from_plain_text_versions(before_text, after_text,
                                                           :inline_style => true,
                                                           :granularity => :word)
  end

end
