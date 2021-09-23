class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, lambda { |sender_id, recipient_id|
    where('(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)', sender_id, recipient_id, recipient_id, sender_id)
  }

  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user
      User.find(sender_id)
    end
  end



  def other_than(current_user)
    if sender_id == current_user.id
      return recipient
    else
      return sender
    end
  end

  def self.conversation_of(current_user)
    @conversations = Conversation.where('sender_id=? OR recipient_id=?', current_user.id, current_user.id)
    return @conversations
  end
end
