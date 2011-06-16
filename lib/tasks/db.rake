require 'yaml'
require 'shell'
include Shell

namespace :db do
  task :rebuild => %w[ environment drop create migrate seed ]

  desc 'Backup database via mysqldump'
  task :backup => :environment do
    directory = File.join( Rails.root, 'db', 'backup' )
    FileUtils.mkdir directory unless File.exists?( directory )
    db = YAML::load( File.open( File.join( Rails.root, 'config', 'database.yml' ) ) )
    db = db[ Rails.env ]
    timestamp = Time.now.utc.iso8601
    execute "mysqldump
      --single-transaction
      -h #{db['host']}
      -u #{db['username']}
      -p#{db['password']}
      #{db['database']}
      |
      gzip
      >
      #{directory}/db_#{timestamp}.sql.gz"
  end

end
