class IO
  def self.write( path, content )
    file = File.new( path, "w" )
    file.write( content )
    file.close
  end
end
