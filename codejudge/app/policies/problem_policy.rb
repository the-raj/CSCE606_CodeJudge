class ProblemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  #Key takeaway: students can read problems but do nothing else

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

  def show?
    user.role? :admin or user.role? :instructor or user.role? :ta or user.role? :student
  end 

end
