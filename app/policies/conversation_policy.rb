class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      raise
      record.user == user
    end

    def show?
      raise
      true
    end

    def create?
      raise
      true
    end
  end
end
