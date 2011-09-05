namespace :notifier do
  desc "send out email notifications for a given chapter"
  task :run => :environment do
    require 'notifier'
    Notifier.run(ENV['story'], ENV['chapter'])
  end

end
