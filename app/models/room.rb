class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  validates :home_type, :room_type, :accommodate, :bed_room, :address,
            :bath_room, presence: true

  validates :listing_name, presence: true, length: {maximum: 75}
  validates :summary, presence: true, length: {maximum: 600}
  validates :price, numericality: { only_integer: true, greater_than: 5 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :active, -> { where(active: true) }
  scope :reservation_dates, -> (start_date, end_date) {
    where(
      "(? <= start_date AND start_date <= ?) OR
      (? <= end_date AND end_date <= ?) OR
      (start_date < ? AND ? < end_date)",
      start_date, end_date,
      start_date, end_date,
      start_date, end_date
    )
  }

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end
end
