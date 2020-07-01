require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "verify the abilities of admin users to do everything" do
      create_admin_abilities
      assert @david_ability.can? :manage, :all
    end

    should "verify the abilities of regular users" do
      create_regular_abilities
      # no global privileges
      deny @ricky_ability.can? :manage, :all
      # testing particular abilities
      assert @ricky_ability.can? :index, Team
      assert @ricky_ability.can? :show, Team
      deny @ricky_ability.can? :create, Team
      deny @ricky_ability.can? :destroy, Team
      deny @ricky_ability.can? :update, Team
      deny @ricky_ability.can? :edit, Team

      # has full read access to users
      assert @ricky_ability.can? :index, User
      assert @ricky_ability.can? :show, @ricky_bottom_team
      assert @ricky_ability.can? :show, @david_top_team
      assert @ricky_ability.can? :show, @matt_bottom_team

      # but can only edit self
      deny @ricky_ability.can? :create, User
      deny @ricky_ability.can? :edit, @david_top_team
      assert @ricky_ability.can? :edit, @ricky_bottom_team
      deny @ricky_ability.can? :update, @david_top_team
      assert @ricky_ability.can? :update, @ricky_bottom_team

      assert @ricky_ability.can? :index, Challenge
      assert @ricky_ability.can? :show, Challenge
      deny @ricky_ability.can? :create, Challenge
      deny @ricky_ability.can? :destroy, Challenge
      deny @ricky_ability.can? :update, Challenge
      deny @ricky_ability.can? :edit, Challenge

      assert @ricky_ability.can? :create, Submission
      deny @ricky_ability.can? :index, Submission
      deny @ricky_ability.can? :show, Submission
      deny @ricky_ability.can? :destroy, Submission
      deny @ricky_ability.can? :update, Submission
      deny @ricky_ability.can? :edit, Submission
      
    end

  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 7134f2a33a504e014c2751ded7fc17e4dd8ed54b
