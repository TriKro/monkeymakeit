# Dev Notes

## Cookie page (to eliminate admin logging)

    http://ROOT/cookie

## When pulling

    git pull --rebase origin master

## Deploying to production / staging

    rake heroku:deploy
    rake heroku:staging                               `

## Script console on production / staging

    heroku console --app monkeymakeit-production
    heroku console --app monkeymakeit-staging

## Copy db from production / staging

    heroku db:pull --app monkeymakeit-production --confirm monkeymakeit-production
    heroku db:pull --app monkeymakeit-staging --confirm monkeymakeit-staging

    NOTE: this will clobber your local db files

## Copy db from production to staging

    heroku pgbackups:capture --app monkeymakeit-production
    heroku pgbackups:restore DATABASE `heroku pgbackups:url --app monkeymakeit-production` --app monkeymakeit-staging --confirm monkeymakeit-staging

## Copy db to production / staging

    heroku db:push --app monkeymakeit-production
    heroku db:push --app monkeymakeit-staging

    NOTE: this will clobber your remote db files

## Copy logs from production / staging

    heroku logs --app monkeymakeit-production
    heroku logs --app monkeymakeit-staging