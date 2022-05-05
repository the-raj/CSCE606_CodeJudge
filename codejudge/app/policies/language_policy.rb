class LanguagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.role? :admin
  end

  def new?
    user.role? :admin
  end

  def destroy?
    user.role? :admin
  end

  def update?
    user.role? :admin
  end

  def edit?
    user.role? :admin
  end

  def index?
    user.role? :admin or user.role? :instructor or user.role? :ta or user.role? :student
  end
end
