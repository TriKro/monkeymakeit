class Notifier
  def self.run(story, chapter)
    story = Story.find(story)
    chapter = story.chapters.find_by_chapter_index(chapter)
    story.subscriptions.each do |s|
      begin
        UserMailer.deliver_new_chapter_email(s.user, story, chapter)
      rescue
        puts "Couldn't email user #{s.user.inspect}"
      end
    end
  end
end
