class Room < ApplicationRecord
  belongs_to :user, optional: true

  validates :room_name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :address, presence: true
  
  mount_uploader :image, ImageUploader
end
