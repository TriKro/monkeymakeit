module AdminHelper

  def parse_scott(activities)
    # Based on array of activities passed in, create an array of only activities relating to Scott's account
    # Note: Does not function on signups since there is no signup information related to a url or code
    # TODO: Clean up code with model. A user can own a code. Every button displayed should relate to that code. Then all activities can be realted to a code as a subtarget.
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
