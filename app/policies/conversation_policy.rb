class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def index?
      @record.creator == user || @record.helper == user
    end

    def show?
      @record.creator == user || @record.helper == user
    end

    def create?
      @record.creator != user
    end
end
