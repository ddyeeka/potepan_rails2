class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
  
  validates :email, presence: true
  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
