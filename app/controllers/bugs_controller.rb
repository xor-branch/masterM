class BugsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_bugs, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]


  def index
    @bug = Bug.new
    if current_user.mentor?
      @bugs = Bug.all
    else
      @bugs = current_user.bugs
    end
  end

  def create
    @bug = current_user.bugs.build(bug_params)
    @bug.statut = 0

    if @bug.save
      redirect_to bugs_path
      flash[:success]="Bug submited successfully"

    else
      flash[:danger]="Bug failed to submited :("
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bug.update(bug_params)
      redirect_to bugs_path
      flash[:success]="Bug submited successfully"
    else
      flash[:danger]="Bug failed to submited :("
      render :edit
    end
  end

  def destroy
    @bug.destroy
    flash[:success]="Bug submited successfully"
    redirect_to bugs_path
  end

  private

  def set_bugs
    @bug = Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :content, :statut)
  end

  def check_user
    unless current_user.id == @bug.user.id || current_user.advisor?
      redirect_to components_dashboard_path
    end
  end

end
