# Dev Notes

## Ruby version

Expects Ruby 1.9.2, eg:

    rvm use 1.9.2-head

## Demo page

http://monkeymake.it/demo

## Cookie page (to eliminate admin logging)

http://monkeymake.it/admin

## Deploying to MonkeyMake.it

    rake heroku:deploy

## Adding & removing Heroku domains (one time operation for each domain)

    bundle exec heroku domains:add MonkeyMake.it          --app suggestedit-production
    bundle exec heroku domains:remove www.suggestedit.org --app suggestedit-production
    bundle exec heroku domains                            --app suggestedit-production  # list domains

## Script console on production

    bundle exec heroku console --app suggestedit-production

## Copy db from production

    heroku db:pull --confirm suggestedit-production

    NOTE: this will clobber your local db files

## When pulling

    git pull --rebase origin master

## Button Rotation

To add a new button, just add it to the

    {RAILS_ROOT}/public/images/widget_buttons/

directory, then run

    rake db:seed

to add an "Invitation" that uses this button.

Buttons must be in our usual sprite format, with normal state above, rollover state below.

NOTE: Removing buttons from this directory will delete the corresponding Invitation model, including any text etc!

## Analytics

Here are some sample queries to look at the analytics:

    Activity.where(:target_model => "Collaborate Button", :activity_type => "Viewed", :created_at => (Time.now.midnight - 7.day)..Time.now.midnight, :url => "/scripts/collaborate.js?code=6e387c5e42a187edab38c7962f7f5a5a").count

    Activity.where(:target_model => "Suggestion", :activity_type => "Began Creating", :created_at => (Time.now.midnight - 7.day)..Time.now.midnight, :url => "/suggestions/new?code=6e387c5e42a187edab38c7962f7f5a5a&url=http://grasshopperherder.com/").count
