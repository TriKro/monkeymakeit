# Dev Notes

* Expects Ruby 1.9.2

## Issues with ruby?

    rvm use 1.9.2-head

## Deploying to MonkeyMake.it

    bundle exec rake heroku:deploy

## Adding a domain to Heroku (one time operation)

    bundle exec heroku domains:add MonkeyMake.it --app suggestedit-production

## When pulling

    git pull --rebase origin master