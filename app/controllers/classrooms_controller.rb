class ClassroomsController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_user!
  before_action :set_classroom, only: [:destroy, :show, :edit, :update, :courses]

  def index
    @classrooms = current_user.classrooms
    @classroom = Classroom.new
  end

  def show
    @courses = @classroom.courses
    @room = Room.new
  end

  def courses
    respond_to do |format|
      @courses = @classroom.courses
      @course = @courses.find(params[:classe])
      format.js { render :template => "classrooms/courses.js.erb"}
    end

  end

  def edit
    @classroom.courses.build
  end

  def update
    @classroom.category = current_user.category
    if @classroom.update(classroom_params)
      redirect_to edit_classroom_path(@classroom)
    else
      flash[:danger]="L'enregistrement a echoué"
    end
  end

  def create
    @classroom = current_user.classrooms.build(classroom_params)
    @classroom.category = current_user.category
    if @classroom.save
      redirect_to classrooms_path
    else
      flash[:danger]= "L'Enregistrement a echoué"
    end
  end

  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'classroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:cover,
                                      :title,
                                      :description,
                                      courses_attributes: {})
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def resolve_layout
    case action_name
    when 'show'
      'home'
    else
      'dashboard'
    end
  end

end
