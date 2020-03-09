class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def show?
    @record.creator == user
  end

  def new?
    true
  end

  def create?
    !user.nil?
  end

  def destroy?
    @record.creator == user
  end

  def update?
    @record.creator == user
  end
end
