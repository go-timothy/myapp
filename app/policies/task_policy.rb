class TaskPolicy < ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def index?
    user.present?
  end

  def show?
    user.has_role?(:read_task, task)
  end

  def new?
    user.has_role?(:create_task)
  end

  def create?
    user.has_role?(:create_task)
  end

  def edit?
    user.has_role?(:update_task, task)
  end

  def update?
    user.has_role?(:update_task, task)
  end

  def destroy?
    user.has_role?(:delete, task)
  end
end
