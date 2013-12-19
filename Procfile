web: bundle exec rails server -p $PORT
worker: rake environment resque:work QUEUE=mail_to_send
