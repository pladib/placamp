class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    true
  end

  def update?
    admin? || user == record
  end

  def destroy?
    admin?
  end

private

  def admin?
    user&.admin?
  end

end
