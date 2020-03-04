class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
      true
    end

  def create?
    !user.nil?
  end

end
