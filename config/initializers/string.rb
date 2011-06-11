class String

  LINE_ENDING = "\n"
  ELLIPSES = '...'

  def sha1
    Digest::SHA1.hexdigest( self )
  end

  def sha512
    Digest::SHA512.hexdigest( self )
  end

  def strip_lines!
    lines = split( LINE_ENDING )
    lines.map!( &:strip )
    processed = lines.join( LINE_ENDING )
    processed.strip!
    replace( processed )
  end

  def compact_whitespace
    self.gsub( /\s+/, ' ' ).strip!
  end

  def truncate( max_length )
    max_length = max_length - ELLIPSES.size
    result = match( chunk_pattern( max_length ) ) && $1
    result ||= self[ 0...max_length ]
    result << ELLIPSES if result.size < self.size 
    result
  end

  def chunk_pattern( max_length )
    %r{
      (?:
        (?:\b|^)
        .{1,#{max_length}}        # lines shorter than max_length
        (?:\s|$)
        |
        [^\s]{#{max_length+1},}   # lines longer than max_length, but with no whitespace, so they should not be broken
      )
    }x
  end

  # creates regexp to match any similar string,
  # ignoring whitespace and case differences
  def similar
    pattern = self.clone
    pattern.gsub!( /\s+/, '\s+' )
    pattern = Regexp.escape( pattern )
    pattern.gsub!( '\\\s\+', '\s+' )
    /#{pattern}/i
  end

end
