# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'resque/tasks'
require File.expand_path('../config/application', __FILE__)

OnoBurrito::Application.load_tasks

task :test_all do
  Rake::Task["minitest:all:quick"].execute
end

task default: :test_all
