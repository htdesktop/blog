class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.is_a?Admin
       can :manage, :all 
    elsif user.is_a?User
       can [:update, :destroy], [Post, Comment], :user_id => user.id
       can :create, [Post, Comment]
       can :read,  [Post, Comment]

       can [:update, :destroy], User, :id => user.id
       can [:read, :create], User
    else
       can :read, [Post, Comment]
       can :create, [User,Comment]
    end

  end
end
