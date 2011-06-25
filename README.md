# Dev Notes

## Ruby version

Expects Ruby 1.9.2

    rvm use 1.9.2-head

## Deploying to MonkeyMake.it

    rake heroku:deploy

## Adding a domain to Heroku (one time operation for each domain)

    bundle exec heroku domains:add MonkeyMake.it --app suggestedit-production

## When pulling

    git pull --rebase origin master

## Demo page

http://monkeymake.it/demo

## Button Rotation

To add a new button, just add it to the

    {RAILS_ROOT}/public/images/widget_buttons/

directory, then run

    rake db:seed

to add an "Invitation" that uses this button.

Note that buttons must be in our usual sprite format, with normal state above, rollover state below.

