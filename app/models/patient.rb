class Patient < ApplicationRecord
	belongs_to :receptionist, class_name: 'User', optional: true

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
