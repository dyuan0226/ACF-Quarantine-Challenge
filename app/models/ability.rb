# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user
    
    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all
      
    elsif user.role? :regular
      # they can read other user's info
      can :index, User
      can :show, User

      can :index, Challenge
      can :show, Challenge 

      can :index, Team
      can :show, Team
      
      # can :index, Photos

      # they can make their own submissions
      can :create, Submission

      # they can delete themselves (make inactive)
      can :destroy, User do |this_user|  
        user.id == this_user.employee_id
      end

      # they can edit their own data
      can :edit, User do |this_user|  
        user.id == this_user.id
      end

      can :update, User do |this_user|  
        user.id == this_user.id
      end
      
    else
      # guests can only read some other stuff?
      can :create, User
    end
  end
end
