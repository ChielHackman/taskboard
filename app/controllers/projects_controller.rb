class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project was successfully created."
      redirect_to projects_path
    else
      flash[:alert] = "Something went wrong. Please try again"
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
