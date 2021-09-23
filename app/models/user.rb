class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  has_many :projects, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :classrooms, dependent: :destroy
  has_many :rooms, dependent: :destroy
  enum category: %i[default digital business arts artisanat soft_skil language]
  mount_uploader :avatar, AvatarUploader

  def avatar_thumbnail
   if avatar.present?
     avatar.url
   else
     'img/faces/team-2.jpg'
   end
 end

 def self.category_name(i)
    if i=="1"
      return "Apprenez un metier du digital"
    elsif i=="2"
      return "Developper vos compétence en business"
    elsif i=="3"
      return "Apprenez un metier de l'art"
    elsif i=="4"
      return "Apprenez un metier de l'artisanat"
    elsif i=="5"
      return "Développer des Softs Skills"
    else
      return "Apprendre une language"
   end
 end

   def self.mentor(i)
     User.where('mentor= ? AND category=?',true,i)
   end
   def self.advisor
     User.find_by(name: "Advisor")
   end
end
