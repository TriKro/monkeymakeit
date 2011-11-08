class FeedbackMessagesController < ApplicationController

  def create
    @feedback_message = FeedbackMessage.new(params[:feedback_message])
    @chapter = Chapter.find(params[:chapter][:id])
    @story = @chapter.story
    @feedback_message.subject = 'Feedback on chapter ' + @chapter.chapter_index.to_s + ' of "' + @chapter.story.title + '"'
    if @feedback_message.valid?
      UserMailer.chapter_feedback(@feedback_message).deliver
      km.record('activity', { 'type' => 'feedback message', 'from' => @feedback_message.try(:sender_email) })
      flash[:notice] = 'Your feedback has been sent to ' + @chapter.story.user.first_name + '. If you left an email, he\'ll reply right back.'
      redirect_to story_chapter_path(@story, @chapter.next_chapter)
    else
      @creatives = @chapter.creatives.sort_by(&:id)
      @user = User.new unless current_user
      render 'chapters/show' # error shown in view
    end
  end

end
