class Match < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_sport_location_description,
    against: [:sport, :location, :description],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  SPORTS = %W[Tennis Football Snowboard Hiking Golf Basketball Darts Bowling Beach\ Volleyball]
  CITY = %W[Meguro Shibuya Gotanda Ebisu Yoyogi Shinjuku Toyosu Harumi Machida]
  DESCRIPTION = [
    'Hello guys, this is Tomo.
  Let’s enjoy practicing and playing together.
  Your level does not matter.',
    'Hi we are looking for more people to join us. Lets have a fun game and shake out those rusty legs.',
    'Check out this event and see if you are interested. Let’s enjoy practicing and playing together.
    Your level does not matter.'
  ]

  LOCATION = [
    "1-1-8 Nishigotanda",
    "1-37-1 Omorihigashi",
    "2-4-36 Meguro",
    "2-2 Tatsumi",
    "1-5-27 Ikejiri",
    "3−21−3 Shibuya",
    "2-1 Jinnan, Shibuya",
    "1-16 Shibaura",
    "6-1-23 Toyosu"
  ]
end
