# require needed files
require './test/sets/teams'
require './test/sets/users'
require './test/sets/challenges'
require './test/sets/submissions'
require './test/sets/abilities'
# require './test/sets/photos'
require './test/sets/abilities'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Teams
  include Contexts::Users
  include Contexts::Challenges
  include Contexts::Submissions
  include Contexts::Abilities
  # include Contexts::Photos
  include Contexts::Abilities
  
  def create_all
    puts "Building context..."
    create_teams
    puts "Built teams"
    create_users
    puts "Built users"
    create_challenges
    puts "Built challenges"
    create_submissions
    puts "Built submissions"
    # create_photos
    # puts "Built photos"
  end

  def destroy_all
    puts "Destroying context..."
    # destroy_photos
    # puts "Destroy photos"
    destroy_submissions
    puts "Destroy submissions"
    destroy_challenges
    puts "Destroy challenges"
    destroy_users
    puts "Destroy users"
    destroy_teams
    puts "Destroy teams"
  end
  
end