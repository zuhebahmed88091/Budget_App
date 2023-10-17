class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else

      can :read, [Category, TransactionDetail]
      can :create, [Category, TransactionDetail]
    end
  end
end
