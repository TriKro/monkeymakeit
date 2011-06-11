class HtmlPage
  def initialize( html, source_url )
    @clean_html = self.class.massage_html( html, source_url )
    @url = source_url
  end

  def self.massage_html( html, source_url )
    html = content_only( html )
    html = sanitize_html( html )
    html = absolutify_links( html, source_url ) if source_url
    html
  end

  def self.content_only( content )
    doc = Nokogiri::HTML( content )
    body = doc / 'html' / 'body'

    [
        # general:
        'div#header',
        'div.header',
        'div#navigation',
        'div.navigation',
        'div#sidebar',
        'div.sidebar',

        # wordpress:
        'div#comments',
        'div#comment-section',

        # wikipedia "message boxes" -- metadata such as "requires cleanup":
        # http://en.wikipedia.org/wiki/Template:Ambox
        'table.ambox',
        'table.tmbox',
        'table.imbox',
        'table.cmbox',
        'table.ombox',
        'table.fmbox',
        'table.dmbox',

        # wikinodes:
        '.jedi_bar_wikinodes',
        '.remix_on_wikinodes_tab',

    ].each do |non_content_css_selector|
      ( body / non_content_css_selector ).remove
    end

    content = body / '#content'
    content = body if content.empty?
    content = content.inner_html
    content
  end

  def self.sanitize_html(html)
    html = html.dup

    %w[ script noscript style ].each do |tag|
      html.gsub!( %r{<#{tag}[^>]*>.*?</#{tag}>}mi, '' )
    end

    Sanitize.clean(
        html,
        {
            :elements => [
                'a', 'abbr', 'acronym', 'address', 'area', 'b', 'big',
                'blockquote', 'br', 'button', 'caption', 'center', 'cite',
                'code', 'col', 'colgroup', 'dd', 'del', 'dfn', 'dir',
                'div', 'dl', 'dt', 'em', 'fieldset', 'form', 'h1',
                'h2', 'h3', 'h4', 'h5', 'h6', 'hr', 'i',
                'img',
                'input', 'ins', 'kbd', 'label', 'legend', 'li', 'map', 'menu',
                'ol', 'optgroup', 'option', 'p', 'pre', 'q', 's', 'samp',
                'select', 'small', 'span', 'strike', 'strong', 'sub',
                'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th',
                'thead', 'tr', 'tt', 'u', 'ul', 'var',
            ],
            :attributes => {
                'a' => ['href'],
                'img' => ['src'],
                :all => ['abbr', 'accept', 'accept-charset',
                         'accesskey', 'action', 'align', 'alt', 'axis',
                         'border', 'cellpadding', 'cellspacing', 'char',
                         'charoff', 'class', 'charset', 'checked', 'cite',
                         'clear', 'cols', 'colspan', 'color',
                         'compact', 'coords', 'datetime', 'dir',
                         'disabled', 'enctype', 'for', 'frame',
                         'headers', 'height', 'hreflang',
                         'hspace', 'id', 'ismap', 'label', 'lang',
                         'longdesc', 'maxlength', 'media', 'method',
                         'multiple', 'name', 'nohref', 'noshade',
                         'nowrap', 'prompt', 'readonly', 'rel', 'rev',
                         'rows', 'rowspan', 'rules', 'scope',
                         'selected', 'shape', 'size', 'span',
                         'start', 'summary', 'tabindex', 'target',
                         'title', 'type', 'usemap', 'valign', 'value',
                         'vspace', 'width']
            },
            :protocols => {
                'a' => {'href' => ['http', 'https', 'mailto', :relative]},
                'img' => {'src' => ['http', 'https', :relative]}
            },

            # consider including for deprecated/historical/or spam-suspect pages:
            # Gollum has a nice way to add this to your config optionally, see:
            # https://github.com/github/gollum/blob/master/lib/gollum/sanitization.rb
            #
            #        :add_attributes => {
            #            'a' => {'rel' => 'nofollow'}
            #        }
        }
    )
  end

  def self.absolutify_links( html, source_url )
    match = source_url.match( %r{(^[a-z]+://[^/]+)(/.+/)}i )
    return html unless match
    base_url = match[ 1 ]
    resource_dir_url = match[ 0 ]   # whole regexp match

    dom = Nokogiri::HTML.fragment( html )
    links = dom / 'a'
    links.each do |link|
      href = link[ 'href' ]
      if href
        link[ 'href' ] =
          case href
            when %r{^/}
              File.join( base_url, href )
            when %r{^\.\.}
              File.join( resource_dir_url, href )
            else
              href
          end
      end
    end
    html = dom.to_s
    html
  end

  def to_text
    text = CGI.unescapeHTML( @clean_html )

    # normalize newlines
    text.gsub!(/\r\n/, "\n")
    text.gsub!(/\r/, "\n")

    # nbsp => ' '
    text.gsub!(/&nbsp;/, ' ')
    # TODO: figure out how to do these in ruby 1.9.2:
    # They now throw 'incompatible encoding -- ascii regexp for utf8 string'
    #    text.gsub!( /\302\240/, ' ' )  # UTF8 for nbsp
    #    text.gsub!( /\240/, ' ' )      # ascii for nbsp

    text.gsub!(/\s+/, ' ')   # all whitespace, including newlines, becomes a single space

    # replace some tags with newlines
    text.gsub!(%r{<br(\s[^>]*)?/?>}i, "\n")
    text.gsub!(%r{<p(\s[^>]*)?/?>}i, "\n\n")
    text.gsub!(%r{</(h\d|p|div|ol|ul)[^>]*>}i, "\n\n")

    # replace some tags with meaningful text markup
    text.gsub!(/<hr[^>]*>/i, "\n\n-------------------------\n\n")
    text.gsub!(/<li[^>]*>/i, "\n* ")

    # remove some tags and their inner html
    text.gsub!(%r{<noscript\b.*?</noscript>}i, '')

    # strip out all remaining tags
    text.gsub!(/<[^>]+>/, '')

    # normalize whitespace
    text.gsub!(/ +/, ' ')
    text.strip_lines!
    text.gsub!( /\n{3,}/, "\n\n" )
    text.strip!

    "#{text}\n"
  end

end