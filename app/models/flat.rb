class Flat < ApplicationRecord
  validates :name, :description, presence: true
end
