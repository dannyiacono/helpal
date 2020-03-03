class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
      # record.user == user
    end

    def show?
      record.user == user
    end
  end
end
