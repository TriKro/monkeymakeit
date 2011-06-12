require_dependency File.dirname( __FILE__ ) + '/../../config/initializers/string'
require_dependency 'html_page'

class Suggestion < ActiveRecord::Base

  validates :before_html, :presence => true

  validates_format_of :email, :allow_blank => true, :with => /^[-a-z0-9_+\.]+@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  default_scope :order => "created_at DESC"

  after_initialize :generate_text_version

  def generate_text_version
    self.before_text ||= HtmlPage.new( before_html, url ).to_text
    self.after_text ||= self.before_text
  end

  def html_diff_with_original
    html_formatted_diff = ''
    html_diff_callback = Diff::LCS::HtmlDiffCallbacks.new(html_formatted_diff)
#    IO.write( "[before] #{url.dehumanize}.txt", before_text )
#    IO.write( "[after] #{url.dehumanize}.txt", after_text )
    Diff::LCS.traverse_sequences(before_chunks, after_chunks, html_diff_callback)
    html_formatted_diff.html_safe
  end

end
