class Creative < ActiveRecord::Base
  belongs_to :chapter
  #XXX: Recreated every single deploy. Fix that if you need new associations.

  def render
    return render_image if creative_type == 'image'
    return render_text if creative_type == 'text'
  end

  def render_image
    "<div class='story_pic'>
      <img src='/images/stories/#{filename}'>
      <div class='art_credit'>
        &ldquo;<b>#{title}</b>&rdquo;
        by #{creator}
      </div></div>"
  end

  def render_text
    contents = File.open("#{Rails.root}/app/views/chapters/#{filename}").readlines.join("\n")
    "<p class='first_p'><span class='first_letter'>#{contents[0..0]}</span>#{contents[1..-1].gsub(/\n\n/, '<p>')}"
  end
end
