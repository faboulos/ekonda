class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one :payement
  accepts_nested_attributes_for :payement
  
end
