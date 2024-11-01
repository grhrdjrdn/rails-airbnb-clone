class Flat < ApplicationRecord
  validates :name, :description, :address, presence: true
  belongs_to :user
  has_many_attached :photos
end
