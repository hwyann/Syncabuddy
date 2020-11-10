class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Match.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end
end
