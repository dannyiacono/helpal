class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      true
    end

    def create?
      record.creator_id == user
    end
  end
end
