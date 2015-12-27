class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
        cannot :manage, :all
        basic_read_only
    elsif user.has_role? :admin
        can :manage, :all
    elsif user.has_role? :member
        can :create, Post
        can :update, Post do |post|
            (post.user_id == user.id)
        end
        can :destroy, Post do |post|
            (post.user_id == user.id)
        end
        basic_read_only
    else
        cannot :manage, :all
        basic_read_only
    end
  end
    private
        def basic_read_only
            can :read, Post
            can :list, Post
        end
end
