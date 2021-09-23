class AdvisorsController < ApplicationController
  layout 'home'
  before_action :authenticate_user!
  before_action :is_advisor!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end



  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :bio,
                                 :avatar,
                                 :speciality,
                                 :video,
                                 :category,
                                 :mentor)
  end

  def resolve_layout
    case action_name
    when 'login', 'register'
      'authentication'
    when 'index'
      'home'
    else
      'dashboard'
    end
  end
end
