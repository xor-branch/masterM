class RoomsController < ApplicationController
  before_action :authenticate_user!


  def create
    @room = current_user.rooms.build(room_params)
    @room.classroom_id = params[:id]
    @classroom = Classroom.find(params[:id])

      if @room.save
        ActionCable.server.broadcast("room_#{@room.classroom_id}",
          { body: @room.body,
            user_name: @room.user.name,
            user_avatar: @room.user.avatar_thumbnail})
      else
        flash[:danger]="Message non posté"
      end

  end
  def room_params
    params.require(:room).permit(:body)
  end

end
