module AdminHelper

  def parse_scott(activities)
    # Create an array of only activities relating to Scott's account
    scott = []
    activities.each do |activity|
      if activity.url.include?("code=")
        code = activity.url.split('?')[1]
        code = code[5,32]
        owner = User.find_by_random_key(code)
        if owner.email == "scott@omnibucket.com"
          scott = scott + [activity]
        end
      end
    end

    scott.count

  end
end
