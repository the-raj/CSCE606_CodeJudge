class TestCasePolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      if user.role? :admin
        scope.all
      elsif user.role? :instructor or user.role? :ta
        scope.where(author :instructor)
      else
        scope.where(example == true)
      end
    end

  end

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
    #Logic re: hidden test cases is handled elsewhere
  end

end
