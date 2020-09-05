# This code is used for potentially creating our own random sets of data to 
# test with. Look to phase 5 in the same directory if you wanna use.

# I used this code to take advantage of the contexts that we made to 
# populate the db with preliminary data.

namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'contexts'
  # executing 'rake db:contexts' will cause this script to run
  task :contexts => :environment do
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate to set up db structure based on latest migrations
    Rake::Task['db:migrate'].invoke
    # Set up test database with that same structure
    # Rake::Task['db:test:prepare'].invoke

    # Now go get the contexts and run the build all method
    require './test/contexts'
    include Contexts
    create_all
    
  end
end