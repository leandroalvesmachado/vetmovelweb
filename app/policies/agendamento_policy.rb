class AgendamentoPolicy < ApplicationPolicy

  def index?
    @user.is_admin? || @user.is_funcionario?
  end

  def show?
    @user.is_admin? || @user.is_funcionario?
  end

  def create?
    @user.is_admin? || @user.is_funcionario?
  end

  def new?
    @user.is_admin? || @user.is_funcionario?
  end

  def update?
    @user.is_admin? || @user.is_funcionario?
  end

  def edit?
    @user.is_admin? || @user.is_funcionario?
  end

  def destroy?
    @user.is_admin?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
