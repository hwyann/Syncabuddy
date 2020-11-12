class Match < ApplicationRecord
  belongs_to :user
  has_many :attendances

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :search_by_sport_location_description,
    against: [:sport, :location, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
