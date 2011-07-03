class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :maybe_commit_activity_log

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:error] = "That record does not exist!"
    log_activity(request.request_uri, "Record not Found")
    redirect_to :back
  end

  private

  def log_activity(url, activity_type, target_model = nil, target = nil, subtarget_model = nil, subtarget = nil)
    maybe_commit_activity_log # We may not have a session id if log_activity is called multiple times. Oh well.
    @activity_to_log = Activity.new(:url => url, :activity_type => activity_type, :target_model => target_model, :target => target, :subtarget_model => subtarget_model, :subtarget => subtarget)
  end

  def maybe_commit_activity_log
    if @activity_to_log && !session[:admin] # don't log our team's clicks
      puts "ERRORERRORERRORERRORERRORERRORERRORERRORERRORERROR: #{request.inspect}" if request.session_options[:id].blank?
      @activity_to_log.session_id = request.session_options[:id]
      @activity_to_log.save
    end
    @activity_to_log = nil
  end

end
