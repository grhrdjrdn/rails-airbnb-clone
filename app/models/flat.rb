class Flat < ApplicationRecord
  validates :name, :description, :address, presence: true
  belongs_to :user
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
