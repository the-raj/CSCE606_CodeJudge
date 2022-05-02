class AttemptPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.role? :admin or user.role? :instructor or user.role? :ta
  end

  def new?
    user.role? :admin or user.role? :instructor or user.role? :ta
  end

  def destroy?
    user.role? :admin or user.role? :instructor or user.role? :ta
  end

  def update?
    user.role? :admin or user.role? :instructor or user.role? :ta
  end

  def edit?
    user.role? :admin or user.role? :instructor or user.role? :ta
  end

  def index?
    user.role? :admin or user.role? :instructor or user.role? :ta or user.role? :student
  end
end
