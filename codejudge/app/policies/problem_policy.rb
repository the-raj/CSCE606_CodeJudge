class ProblemPolicy < ApplicationPolicy

  def create?
    user.role? :admin or user.role? :instructor or user.role? :ta
  end

  def destroy?
    ##
  end

  def update?
    ##
  end
  
end
