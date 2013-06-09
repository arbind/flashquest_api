# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

FlashquestApi::Application.load_tasks


Rake.application.instance_variable_get('@tasks').delete('db:reset')

namespace :db do
  desc 'Disabled: rake db:drop'
    if ENV['RAILS_ENV'] == 'production'
    task :drop do
      puts "rake db:drop is disabled in production - it drops user tables"
    end
  end

  desc 'Resets your database using your migrations for the current environment'
  task :reset do
    puts 'Overriding db:reset with [db:purge, db:seed]'
    if ENV['RAILS_ENV'] == 'production'
      Rake::Task["db:purge"].invoke
      Rake::Task["db:seed"].invoke
    end
  end

end
