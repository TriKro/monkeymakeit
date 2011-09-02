module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def scripts(scripts_name)
    # TODO: Allow this to pass an array back to layout.
    content_for(:scripts) { scripts_name }
  end

  def stylesheets(stylesheets_name)
    # TODO: Allow this to pass an array back to layout.
    content_for(:stylesheets) { stylesheets_name }
  end

  def fonts(fonts_name)
    # TODO: Allow this to pass an array back to layout.
    content_for(:fonts) { fonts_name }
  end

end
