class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      record.user == user
    end

    def show?
      true
    end

    def create?
      true
    end
  end
end
