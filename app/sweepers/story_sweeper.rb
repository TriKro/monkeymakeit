class StorySweeper < ActionController::Caching::Sweeper

  observe Story

  def after_create(story)
    km.record('activity', { 'type' => 'created story', 'story' => story.title, 'author' => story.user.identifier, 'url' => request.referer.split("?")[0] })
  end

end