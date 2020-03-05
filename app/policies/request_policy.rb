class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
      true
    end

    def new?
      true
    end

    def create?
      !user.nil?
    end
end
