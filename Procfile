web: bundle exec rails server -p $PORT
worker: RAILS_ENV=production rake environment resque:work QUEUE=mail_to_send
