class ChapterSweeper < ActionController::Caching::Sweeper

  observe Chapter

  def after_create(chapter)
    km.record('activity', { 'type' => 'created chapter', 'story' => chapter.story.title, 'author' => chapter.story.user.identifier, 'chapter' => chapter.chapter_index, 'url' => request.referer.split("?")[0] })
  end

end