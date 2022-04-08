class TestCasePolicy < ApplicationPolicy

  def create?
    user.role? :admin or user.role? :instructor or user.role? :ta 
  end

  def delete?
    user.role? :admin or user.role? :instructor or user.role? :ta 
  end

  def update?
    user.role? :admin or user.role? :instructor or user.role? :ta 
  end

  def destroy?
    user.role? :admin or user.role? :instructor or user.role? :ta 
  end

  def index?
    user.role? :admin or user.role? :instructor or user.role? :ta 
  end

  def show?
    user.role? :admin or user.role? :instructor or user.role? :ta or user.role? :student
  end
  
end
