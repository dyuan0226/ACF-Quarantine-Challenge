module Contexts
  module Submissions
    def create_submissions
      @sub1 = FactoryBot.create(:submission, challenge: @read_john, user: @david_top_team)
      @sub2 = FactoryBot.create(:submission, challenge: @sleep_well, user: @david_top_team, date_completed: 2.days.ago.to_date)
      @sub3 = FactoryBot.create(:submission, challenge: @write_poetry, user: @david_top_team, date_completed: 3.days.ago.to_date)
      @sub4 = FactoryBot.create(:submission, challenge: @read_john, user: @amy_top_team, date_completed: 4.days.ago.to_date)
      @sub5 = FactoryBot.create(:submission, challenge: @chore_tracker, user: @amy_top_team, date_completed: 2.days.ago.to_date)
      @sub6 = FactoryBot.create(:submission, challenge: @read_john, user: @ricky_bottom_team, date_completed: 2.days.ago.to_date)
      @sub7 = FactoryBot.create(:submission, challenge: @memorize_2_tim, user: @ricky_bottom_team)
      @sub8 = FactoryBot.create(:submission, challenge: @write_poetry, user: @ricky_bottom_team, date_completed: 2.days.ago.to_date)
    end
    
    def destroy_submissions
      @sub1.destroy
      @sub2.destroy
      @sub3.destroy
      @sub4.destroy
      @sub5.destroy
      @sub6.destroy
      @sub7.destroy
      @sub8.destroy
    end
  end
end
