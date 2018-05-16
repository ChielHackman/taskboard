class TasksController < ApplicationController
  before_action :find_project

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task was successfully created."
      redirect_to @project
    else
      flash[:notice] = "Something went wrong. Please try again later."
      redirect_to @project
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
