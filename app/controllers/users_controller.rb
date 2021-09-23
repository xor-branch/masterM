class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:comment]

  layout "home"
  PER = 4

  def index
    if params[:category]
      @users = User.mentor(params[:category]).page(params[:page]).per(8)
      @category_name = User.category_name(params[:category])
    else
      @users = User.where(mentor: true).page(params[:page]).per(4)
   end
  end

  def show
    @user = User.find(params[:id])
    @comments = Comment.where(target_id: @user.id)
    @comment = current_user.comments.build if user_signed_in?
  end

  def update
    @user = current_user
    if @user.update(user_params)
        redirect_to components_dashboard_path
    else
        flash[:danger]="something is wrong !"
    end
  end


  def comment
    @comments = Comment.where(target_id: params[:id])
    @user = current_user
    @comment = @user.comments.build(comment_params)
    @comment.target_id = params[:id]
    respond_to do |format|
      if @comment.save
          format.js { render 'users/shared/comment.js.erb'}
      else
          flash[:danger]="something is wrong !"
      end
    end
  end

  def edit_comment
    @target_id= params[:target_id]
    @user = current_user
    @comment = @user.comments.find(params[:id])
    respond_to do |format|
      format.js { render 'users/shared/edit_comment.js.erb'}
    end
  end

  def update_comment
    @user = current_user
    @comments = Comment.where(target_id: params[:target_id])

    @comment = @user.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        #format.js {render inline: "location.reload();" }
        format.js { render 'users/shared/comment.js.erb'}
      else
        format.js { render 'users/shared/edit_comment.js.erb'}
      end
    end
  end

  private
  def check_user
    if user_signed_in?
      @user = current_user
    end
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :bio,
                                 :avatar,
                                 :video)
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end
end
