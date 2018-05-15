class ProjectsController < ApplicationController
  before_action :find_project, only:[:edit, :update, :show, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project was successfully created."
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Project was successfully updated."
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = "Project was successfully deleted."
      redirect_to root_path
    else
      flash[:info] = "Could not delete project. Please try again later."
      redirect_to project_path(@project)
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
