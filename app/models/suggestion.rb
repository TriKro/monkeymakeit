require_dependency File.dirname(__FILE__) + '/../../config/initializers/diff_lcs'
require_dependency File.dirname(__FILE__) + '/../../config/initializers/string'

class Suggestion < ActiveRecord::Base

  has_many :activities, :as => :target
  has_many :activities, :as => :subtarget

  validates :before_html, :presence => true

  validates_format_of :email, :allow_blank => true, :with => /^[-a-z0-9_+\.]+@([-a-z0-9]+\.)+[a-z0-9]{2,}$/i

  default_scope :order => "created_at DESC"

  after_initialize :generate_text_version

  def generate_text_version
    self.before_text ||= HtmlMassage.new( before_html, :source_url => url, :ignored_selectors => IGNORED_SELECTORS ).to_text
    self.after_text ||= self.before_text
  end

  def html_diff_with_original
    Diff::LCS::HtmlDiff.html_diff_from_plain_text_versions(before_text, after_text,
                                                           :inline_style => true,
                                                           :granularity => :word)
  end

  IGNORED_SELECTORS = [
      # general:
      'div#header',
      'div.header',
      '#footer',
      'div#navigation',
      'div.navigation',
      'div#sidebar',
      'div.sidebar',
      '#breadcrumbs',
      '.backfornav',

      # wordpress:
      'div#comments',
      'div#comment-section',
      'div#respond',

      # wikipedia "message boxes" -- metadata such as "requires cleanup":
      # see http://en.wikipedia.org/wiki/Template:Ambox
      'table.ambox',
      'table.tmbox',
      'table.imbox',
      'table.cmbox',
      'table.ombox',
      'table.fmbox',
      'table.dmbox',

      # social media sharing:
      'ul#sharebar',
      'ul#sharebarx',

      # signup:
      '#mailchimp_signup_bottom',

      # wikinodes:
      '.jedi_bar_wikinodes',
      '.remix_on_wikinodes_tab',

      # Posterous blog
      'div.editbox',
      'div.postmeta',
      'div.tag-listing',
      'div.posterous_tweet_button',
      'div.comment-count',
      'div.col#secondary',

    ].freeze

end
