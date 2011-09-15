class Notifier
  def self.run(story, chapter)
    story = Story.find(story)
    chapter = story.chapters.find_by_chapter_index(chapter)
    if story.subscriptions.collect{|x| x.user_id}.find_index(133) != 65
      puts "DB changed!!!!"
      return
    end

    story.subscriptions[66..-1].each do |s|
      begin
        UserMailer.deliver_new_chapter_email(s.user, story, chapter)
      rescue
        puts "Couldn't email user #{s.user.inspect}"
      end
    end
  end
end
