# frozen_string_literal: true

class TaskPolicy
  attr_reader :user, :task

  def initialize(user, task)
    # @type [Parrots::Description]
    @user = user
    # @type [Parrot]
    @task = task
  end

  def manager?
    @user.manager? || @user.admin?
  end

  def worker?
    @user.worker?
  end

  def index?
    true
  end

  def shuffle?
    manager?
  end

  def update?
    manager? || @task.assignee_public_id == @user.public_id
  end

  def resolve?
    update?
  end

  def show?
    update?
  end

  def create?
    true
  end

  def destroy?
    manager?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.manager? || @user.admin?
        @scope
      else
        @scope.where(assignee_public_id: @user.public_id)
      end
    end
  end

  class Params
    def initialize(user, params, defaults: {})
      @user = user
      @params = params
      @defaults = defaults
    end

    def resolve
      @defaults.merge(permitted)
    end

    def permitted
      if @user.manager? || @user.admin?
        @params.require(:task).permit(:name, :assignee_public_id)
      else
        @params.require(:task).permit(:name)
      end
    end
  end
end
