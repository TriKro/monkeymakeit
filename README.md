# Dev Notes

## Cookie page (to eliminate admin logging)

http://monkeymake.it/cookie

## Deploying to monkeymakeit-staging

    rake heroku:staging

## Deploying to monkeymakeit-production

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

## Copy logs from production

    heroku logs --app suggestedit-production

## Creating a new heroku app

Let's say we have a branch "omniauth", which we want to deploy to a new heroku app.  Create the app thus:

    rake heroku:create TARGET=omniauth

Then deploy to it:

    rake heroku:deploy TARGET=omniauth REF=omniauth

And view it here:

    http://suggestedit-omniauth.heroku.com/

## When pulling

    git pull --rebase origin master
