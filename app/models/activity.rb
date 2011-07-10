class Activity < ActiveRecord::Base

  belongs_to :user # the user that causes the activity

  belongs_to :target, :polymorphic => true # the activity target(e.g. if you vote an answer, the target can be the answer )
  belongs_to :subtarget, :polymorphic => true # the  we added this later since we feel the need for a secondary target, e.g if you rate an answer, target is your answer, secondary target is your rating.

  default_scope :order => "created_at DESC"

  def self.unique_sessions(where_clauses)
    sessions = {}
    Activity.where(where_clauses).reverse.each do |x|
      sessions[x.session_id] ||= []
      sessions[x.session_id] << x
    end
    return sessions
  end

  def self.landing_page_views_before_click(sessions)
    sessions.select do |session_id, activities|
      activities_contain_landing_page_before_any_crouts(activities)
    end
  end

  def self.activities_contain_landing_page_before_any_crouts(activities) # crouts are optional
    activities.each do |activity|
      next if activity.activity_type != 'Viewed'
      if ['/', 'http://monkeymake.it', 'http://monkeymake.it/'].include?(activity.url)
        return true
      elsif activity.url.index('gallows') || activity.url.index('doris') || activity.url.index('hiccup') || activity.url.index('heart')
        return false
      end
    end
    return false
  end

  def self.landing_page_clicks_after_view(sessions)
    sessions.select do |session_id, activities|
      activities_contain_crouts_after_landing_page(activities)
    end
  end

  def self.activities_contain_crouts_after_landing_page(activities) # landing page is required
    state = 0
    activities.each do |activity|
      next if activity.activity_type != 'Viewed'
      state=1 if state == 0 && ['/', 'http://monkeymake.it', 'http://monkeymake.it/'].include?(activity.url)
      return state == 1 if activity.url.index('gallows')
      return state == 1 if activity.url.index('/doris')
      return state == 1 if activity.url.index('/hiccup')
      return state == 1 if activity.url.index('/heart')
    end
    return false
  end

  def self.button_clicks(sessions)
    sessions.select do |session_id, activities|
      activities.index {|activity| activity.activity_type == 'Clicked'} # Assuming there are no click events anywhere else but on crouts
    end
  end

  def self.signups(sessions)
    sessions.select do |session_id, activities|
      activities.index { |activity| activity.activity_type == 'Created' && activity.target_type = 'User' }
    end
  end

  def self.crout_view_without_landing_page(sessions)
    sessions.select do |session_id, activities|
      activities_contain_some_crout_before_landing_page(activities)
    end
  end

  def self.activities_contain_some_crout_before_landing_page(activities) # landing page is optional
    activities.each do |activity|
      next if activity.activity_type != 'Viewed'
      if ['/', 'http://monkeymake.it', 'http://monkeymake.it/'].include?(activity.url)
        return false
      elsif activity.url.index('gallows') || activity.url.index('doris') || activity.url.index('hiccup') || activity.url.index('heart')
        return true
      end
    end
    return false
  end

end
