class EventPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def create?
    user
  end

  def update?
    user
  end

  def destroy?
    admin?
  end

  def booked?
    user.events.include?(record)
  end

  def bookable?
    user && !booked?
  end

private

  def admin?
    user&.admin?
  end
end
