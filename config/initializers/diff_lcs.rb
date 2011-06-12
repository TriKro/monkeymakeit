require 'diff/lcs'

class Diff::LCS::HtmlDiffCallbacks #:nodoc:
  attr_accessor :output

  def initialize(output)
    @output = output
  end

  # This will be called with both lines are the same
  def match(event)
    @output << format( event.old_element )
  end

  # This will be called when there is a line in A that isn't in B
  def discard_a(event)
    @output << format( event.old_element, :del )
  end

  # This will be called when there is a line in B that isn't in A
  def discard_b(event)
    @output << format( event.new_element, :ins )
  end

  def format( content, tag=nil )
    opening_tag, closing_tag = "<#{tag}>", "</#{tag}>" if tag
    content.whitespace? ? content.gsub( /(\r?\n)/, '<br />\1' ) : "#{opening_tag}#{content}#{closing_tag}\n"
  end

end

