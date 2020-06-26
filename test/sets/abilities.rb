module Contexts
  module Abilities
    # Admins
    def create_admin_abilities
      create_teams
      create_users
      create_challenges
      create_submissions
      @david_ability = Ability.new(@david_top_team)
    end

    # regulars
    def create_regular_abilities
      create_teams
      create_users
      create_challenges
      create_submissions
      @ricky_ability = Ability.new(@ricky_bottom_team)
    end

  end
end