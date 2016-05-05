class EventPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def booked?
    user.events.include?(record)
  end

  def bookable?
    !booked?
  end
end
