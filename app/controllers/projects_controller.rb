class ProjectsController < ApplicationController
  layout 'dashboard'
  before_action :set_projects, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end


  def edit
  end


  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Bug was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_projects
      @project = current_user.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :statut, :start, :deadline, :description)
    end
end
