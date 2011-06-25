require 'image_size'

button_paths = Dir[ Rails.root.join( *%w[ public images widget_buttons * ] ) ]
button_paths.each do |button_path|
  button_name = button_path.split('/').last
  invitation = Invitation.where(:button_name => button_name).first || Invitation.new(:button_name => button_name)
  image_width, image_height = open(button_path, 'rb') { |button_file| ImageSize.new(button_file.read).get_size }
  invitation.button_width  = image_width
  invitation.button_height = image_height / 2   # This assumes all images are sprites, with rollover image stacked below the normal state
  invitation.save!
end
