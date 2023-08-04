class Room < ApplicationRecord
  belongs_to :user, optional: true
  has_one :reservation
  has_many :reservations
  has_many :reservations, dependent: :destroy

  validates :room_name, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  mount_uploader :image, ImageUploader

  scope :in_area, ->(area) { where("address LIKE ?", "%#{area}%") }
  scope :search, ->(query) { where("room_name LIKE :query OR body LIKE :query", query: "%#{query}%") }

end
