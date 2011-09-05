class CreativeSweeper < ActionController::Caching::Sweeper

  observe Creative

  def after_create(creative)
    km.record('activity', { 'type' => 'created creative', 'creative' => creative.title, 'creative type' => creative.creative_type, 'author' => creative.user.identifier, 'url' => request.referer.split("?")[0] })
  end

end