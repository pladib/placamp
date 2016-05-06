class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def booked?
    user&.events&.include?(record)
  end

  def bookable?
    user && !booked?
  end

  def book?
    bookable?
  end

  def cancel_booking?
    booked?
  end

private

  def admin?
    user&.admin?
  end

end
