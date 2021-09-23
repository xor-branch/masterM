class Meeting < ApplicationRecord
  belongs_to :user

  def start_time
      self.day ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

   def self.meetings_of(current_user)
     current_user.meetings + Meeting.where(guest: current_user.id)
   end
end
