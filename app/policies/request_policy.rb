class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

<<<<<<< HEAD
    def index?
      true
=======
    def show?
      @record.creator == user
>>>>>>> master
    end

    def new?
      true
    end

    def create?
      !user.nil?
    end
end
