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
  end
end
