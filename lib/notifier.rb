class Notifier
  def self.run(story, chapter)
    story = Story.find(story)
    chapter = story.chapters.find_by_chapter_index(chapter)
    story.subscriptions.reverse.each do |s| # reverse just for dev/staging; first mail shouldn't be from Scott to Scott
      begin
        UserMailer.deliver_new_chapter_email(s.user, story, chapter)
      rescue ActionView::Template::Error => e
        puts "Couldn't construct email for user #{s.user.inspect}: #{e.message}"
      rescue => e
        puts "Couldn't email user #{s.user.inspect}: #{e}"
      end
    end
  end
end
