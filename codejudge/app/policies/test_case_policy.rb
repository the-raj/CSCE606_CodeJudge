class TestCasePolicy < ApplicationPolicy

  def create?
    user.role? :admin or user.role? :instructor or user.role? :ta 
  end

  def delete?
    ##
  end

  def update?
    ##
  end

  def destroy?
    ##
  end
  
end
