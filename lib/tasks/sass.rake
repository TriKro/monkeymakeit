require 'shell'
include Shell

namespace :sass do
  task :delete => :environment do
    execute "rm -rf #{ Dir[ Rails.root.join( 'public/stylesheets/sass/*.sass' ) ].join( ' ' ) }"
  end
end
