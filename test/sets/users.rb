module Contexts
  module Users
    def create_users
      @david_top_team = FactoryBot.create(:user, first_name: "David", last_name: "Yuan", team: @top_team_active, username: "dyuan", admin_password: "password", email: "dyuan@gmail.com")
      @amy_top_team = FactoryBot.create(:user, first_name: "Amy", last_name: "Lu", team: @top_team_active, username: "alu", admin_password: "password", email: "alu@gmail.com")
      @ricky_bottom_team = FactoryBot.create(:user, first_name: "Ricky", last_name: "Ma", team: @bottom_team_active, username: "rma", email: "rma@gmail.com")
      @matt_bottom_team = FactoryBot.create(:user, first_name: "Matthew", last_name: "Fang", team: @bottom_team_active, username: "mfang", email: "mfang@gmail.com")
      @inactive_user_1 = FactoryBot.create(:user, first_name: "Inactive", last_name: "One", team: @inactive_team, username: "inactive1", email: "inactive1@gmail.com", active: false)
      @inactive_user_2 = FactoryBot.create(:user, first_name: "Inactive", last_name: "Two", team: @inactive_team, username: "inactive2", email: "inactive2@gmail.com", active: false)
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