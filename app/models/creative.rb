class Creative < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :user
  #XXX: Recreated every single deploy. Fix that if you need new associations.

  scope :images, where(:creative_type => 'image')
  scope :text, where(:creative_type => 'text')

  def render
    return render_image if creative_type == 'image'
    return render_text if creative_type == 'text'
  end

  def render_image
    "<div class='story_pic'>
      <img src='/chapters/#{filename}'>" +
      (creator.present? ? "<div class='art_credit'>illustration by <b>#{creator}</b></div>" : "") +
    "</div>"
  end

  def render_text
    contents = File.open("#{Rails.root}/public/chapters/#{filename}").readlines.join("\n")
    "<p class='first_p'><span class='first_letter'>#{contents[0..0]}</span>#{contents[1..-1].gsub(/\n\n/, '<p>')}"
  end
end
