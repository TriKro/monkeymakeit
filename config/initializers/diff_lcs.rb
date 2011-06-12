require 'diff/lcs'

class Diff::LCS::HtmlDiff

  def self.html_diff_from_plain_text_versions(before_text, after_text, options)
    defaults = {
            :granularity => :sentence,
            :inline_style => false,
            }
    options = defaults.merge( options )

    html_formatted_diff = ''
    html_diff_callback = Diff::LCS::HtmlDiffCallbacks.new(html_formatted_diff, options)

#    IO.write( "[before].txt", before_text )
#    IO.write( "[after].txt", after_text )

    before_chunks, after_chunks = case options[ :granularity ]
      when :sentence
        [ before_text.sentences, after_text.sentences ]
      when :word
        [ before_text.words, after_text.words ]
      else
        raise "Unexpected granularity #{options[ :granularity ].inspect}"
    end

    Diff::LCS.traverse_sequences(before_chunks, after_chunks, html_diff_callback)
    html_formatted_diff.html_safe
  end
end

class Diff::LCS::HtmlDiffCallbacks #:nodoc:
  attr_accessor :output

  def initialize(output, options={})
    @output = output
    @options = options
  end

  # This will be called with both lines are the same
  def match(event)
    @output << format(event.old_element)
  end

  # This will be called when there is a line in A that isn't in B
  def discard_a(event)
    @output << format(event.old_element, :del)
  end

  # This will be called when there is a line in B that isn't in A
  def discard_b(event)
    @output << format(event.new_element, :ins)
  end

  def format(content, tag=nil)
    opening_tag = "<#{ [tag, inline_style(tag)].compact.join(' ') }>" if tag
    closing_tag = "</#{tag}>" if tag
    content.whitespace? ? content.gsub(/(\r?\n)/, '<br />\1') : "#{opening_tag}#{content}#{closing_tag}\n"
  end

  def inline_style(tag)
    if @options[:inline_style]
      style_details = case tag
        when :ins
          "background-color: #FF7; text-decoration: none;"
        when :del
          "text-decoration: line-through;"
        else
          raise "Unexpected tag #{tag.inspect}"
        end
      %{style="#{style_details}"}
    end
  end
end

