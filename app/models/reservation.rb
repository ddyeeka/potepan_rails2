class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true

  has_one_attached :image

  validates :start_date, presence: true
  validates :end_date, on: :create, presence: true

  validate :date_compare

  private

  def date_compare
    if start_date != nil && end_date != nil && start_date > end_date
      errors.add(:start_date,": 終了日は開始日以降日付で選択してください")
    end
  end
end
