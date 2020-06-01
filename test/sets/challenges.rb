module Contexts
  module Challenges
    def create_challenges
      @read_john = FactoryBot.create(:challenge)
      @memorize_2_tim = FactoryBot.create(:challenge, name: "Memorize 2 Timothy", description: "Memorize the book of 2 Timothy.", category: "Bible", num_points: 200)
      @sleep_well = FactoryBot.create(:challenge, name: "Sleep well", description: "Get 8 hours of sleep (between the hours of 11pm and 9am) for 5 days in a row.", category: "Lifestyle", num_points: 30)
      @chore_tracker = FactoryBot.create(:challenge, name: "Do your chores", description: "Do at least one chore a day every day for a week.", category: "Lifestyle", num_points: 40)
      @write_poetry = FactoryBot.create(:challenge, name: "Write some poetry", description: "Write some poetry and post it.", category: "Creative", num_points: 30)
    end
    
    def destroy_challenges
      @read_john.destroy
      @memorize_2_tim.destroy
      @sleep_well.destroy
      @chore_tracker.destroy
      @write_poetry.destroy
    end
  end
end