class TaskPolicy < ApplicationPolicy
    attr_reader :user, :task
  
    def initialize(user, task)
      @user = user
      @task = task
    end
  
    def index?
      false
      # if set to false - no one will have access
    end
  
    def show?
      false
    end
  
    # Same as for create 
    def new?
      create?
    end
  
    # Same as that of the update.
    def edit?
      update?
    end
  
    # Only admin is allowed to update the task and only if task is not published
    def update?
      user.isAdmin?
    end
  
    # Only admin is allowed to create the task.
    def create?
      user.isAdmin?
    end
  
    def destroy?
      user.isAdmin?
    end
  end
  