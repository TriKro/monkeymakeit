# Dev Notes

## Ruby version

Expects Ruby 1.9.2

    rvm use 1.9.2-head

## Demo page

http://monkeymake.it/demo

## Cookie page (to eliminate admin logging)

http://monkeymake.it/admin

## Deploying to MonkeyMake.it

    rake heroku:deploy

## Adding a domain to Heroku (one time operation for each domain)

    bundle exec heroku domains:add MonkeyMake.it --app suggestedit-production

## Script console on production

    be heroku console --app suggestedit-production

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
