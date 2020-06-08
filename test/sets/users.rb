module Contexts
  module Users
    def create_users
      @david_top_team = FactoryBot.create(:user, first_name: "David", last_name: "Yuan", team: @top_team_active, username: "dyuan", role: "admin", email: "dyuan@gmail.com", active: true)
      @amy_top_team = FactoryBot.create(:user, first_name: "Amy", last_name: "Lu", team: @top_team_active, username: "alu", role: "admin", email: "alu@gmail.com", active: true)
      @ricky_bottom_team = FactoryBot.create(:user, first_name: "Ricky", last_name: "Ma", team: @bottom_team_active, username: "rma", role: "regular", email: "rma@gmail.com", active: true)
      @matt_bottom_team = FactoryBot.create(:user, first_name: "Matthew", last_name: "Fang", team: @bottom_team_active, username: "mfang", role: "regular", email: "mfang@gmail.com", active: true)
      @inactive_user_1 = FactoryBot.create(:user, first_name: "Inactive", last_name: "One", team: @inactive_team, username: "inactive1", role: "regular", email: "inactive1@gmail.com", active: false)
      @inactive_user_2 = FactoryBot.create(:user, first_name: "Inactive", last_name: "Two", team: @inactive_team, username: "inactive2", role: "regular", email: "inactive2@gmail.com", active: false)
    end
    
    def destroy_users
      @david_top_team.destroy
      @amy_top_team.destroy
      @ricky_bottom_team.destroy
      @matt_bottom_team.destroy
      @inactive_user_1.destroy
      @inactive_user_2.destroy
    end
  end
end