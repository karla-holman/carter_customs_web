class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin
      can :dashboard
      can :access, :rails_admin
      can :read, :all
      can :manage, :all
    end
  end
end
