# ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Define abilities for the user
    can :read, :all # Allow users to read all resources

    if user.admin?
      can :manage, :all # Admins can manage all resources
    else
      can :manage, Post, author_id: user.id # Users can manage their own posts
      can :manage, Comment, user_id: user.id # Users can manage their own comments
    end
  end
end
