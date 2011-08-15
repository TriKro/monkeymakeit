# Dev Notes

## Cookie page (to eliminate admin logging)

    http://ROOT/cookie

## Deploying to production / staging

    rake heroku:deploy
    rake heroku:staging

## Script console on production / staging

    heroku console --app APP_NAME-production
    heroku console --app APP_NAME-staging

## Copy db from production / staging

    heroku db:pull --app APP_NAME-production --confirm APP_NAME-production
    heroku db:pull --app APP_NAME-staging --confirm APP_NAME-staging

    NOTE: this will clobber your local db files

## Copy db from production / staging

    heroku db:push --app APP_NAME-production --confirm APP_NAME-production
    heroku db:push --app APP_NAME-staging --confirm APP_NAME-staging

    NOTE: this will clobber your remote db files

## Copy logs from production / staging

    heroku logs --app APP_NAME-production
    heroku logs --app APP_NAME-staging

## When pulling

    git pull --rebase origin master