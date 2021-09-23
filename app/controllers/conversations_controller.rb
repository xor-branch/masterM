class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
     @conversations = Conversation.all
   end

   def create

     if user_signed_in?
       @conversation = if Conversation.between(current_user.id, params[:recipient_id]).present?
                         Conversation.between(current_user.id, params[:recipient_id]).first
                       else
                         Conversation.create!(sender_id:current_user.id, recipient_id: params[:recipient_id])
                       end
       redirect_to components_conversations_path(id: @conversation.id)
     else
       redirect_to root_path
     end
   end

   private

   def conversation_params
     params.permit(:sender_id, :recipient_id)
   end
end
