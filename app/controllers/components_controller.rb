class ComponentsController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_user!, :only => [:dashboard, :meeting, :create_meeting, :create_conversation]

  PER = 4

  def index
    @digital = User.mentor(1)
    @business = User.mentor(2)
    @arts = User.mentor(3)
    @artisanat = User.mentor(4)
    @soft_skill = User.mentor(5)
    @language = User.mentor(6)
  end

  def classrooms
    if params[:category]
      category = params[:category]

      @classrooms = Classroom.where(category: category ).page(params[:page]).per(6)
    else
      @classrooms = Classroom.all.page(params[:page]).per(6)
    end
  end

  def meeting
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.meetings_of(current_user)
    @guest = User.find(params[:id])

    @meeting = current_user.meetings.build
  end

  def meetings
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.meetings_of(current_user)

    #@meetings = Meeting.where(start_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def create_meeting
    @meeting = current_user.meetings.build(meeting_params)
    @meeting.guest = params[:id]

    @meeting.save
    redirect_to "/components/meetings"
  end


  def conversations
    if params[:id]
      @conversation = Conversation.find(params[:id])
    else
      @conversation = Conversation.conversation_of(current_user).last
    end
    @conversations = Conversation.conversation_of(current_user)
    if @conversation != nil
      @messages = @conversation.messages
      @message = @conversation.messages.build
    else
      @messages = nil
    end

    if @conversation.messages == nil && @conversation.recipient_id == User.advisor.id && !current_user.advisor? && !current_user.mentor?
      @conversation.sender_id = current_user.id
      @conversation.messages.create!(
                          user_id: User.advisor.id,
                          content:"Bonjour, vous avez fait une demande pour demandepour devenir mentor, veuillez nous laisser un message comportant votre Nom prenom et specialite",
                           created_at: Time.now
                        )

    end
  end
  def create_conversation
    @conversation = Conversation.find(params[:id])
    @message = @conversation.messages.build(message_params)
    @messages = @conversation.messages

    respond_to do |format|
        if @message.save
          #format.js { render 'users/shared/comment.js.erb'}
          format.js { render "messages/index.js.erb" }
          #redirect_to components_conversations_path(@conversation)
        else
          render 'index'
        end
      end
  end

  def dashboard
    @projects = Project.all
    @user = User.find(current_user.id)
  end

  # def user_update
  #   if @user.update(user_params)
  #       redirect_to components_dasboard_path
  #   else
  #       flash[:danger]="something is wrong !"
  #   end
  # end

  private
  def meeting_params
    params.require(:meeting).permit(:title, :day, :start_at, :end_at)
  end

  def resolve_layout
    case action_name
    when 'login', 'register'
      'authentication'
    when 'index','classrooms'
      'home'
    else
      'dashboard'
    end
  end
  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end
