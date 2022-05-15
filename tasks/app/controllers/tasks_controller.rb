class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy resolve ]

  helper_method :task_policy

  # GET /tasks or /tasks.json
  def index
    @tasks = policy_scope(Task.all.order(:created_at))
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def resolve
    authorize(@task)
    Tasks::ResolveTask.call(@task)
    redirect_to tasks_path
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    authorize(@task)

    if @task.save
      redirect_to task_url(@task), notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    authorize(@task)

    if @task.update(task_params)
      redirect_to task_url(@task), notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    authorize(@task)
    @task.destroy

    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  def shuffle
    authorize(current_parrot)
    Tasks::ShuffleTasks.call
    redirect_to tasks_path, notice: 'Tasks are reassigned.'
  end

  private

  def task_policy
    TaskPolicy.new(current_parrot, @task)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id] || params[:task_id] )
  end

  # Only allow a list of trusted parameters through.
  def task_params
    TaskPolicy::Params.new(
      current_parrot,
      params,
      defaults: { assignee_public_id: current_parrot.public_id }
    ).resolve
  end
end
