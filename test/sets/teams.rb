module Contexts
  module Teams
    def create_teams
      @top_team_active = FactoryBot.create(:team, name: "Top Team", description: "we are number 1", active: true)
      @bottom_team_active = FactoryBot.create(:team, name: "Bottom Team", description: "we are number 2", active: true)
      @inactive_team = FactoryBot.create(:team, name: "Inactive Team", description: "we are inactive", active: false)
    end
    
    def destroy_teams
      @top_team_active.destroy 
      @bottom_team_active.destroy 
      @inactive_team.destroy 
    end
  end
end
