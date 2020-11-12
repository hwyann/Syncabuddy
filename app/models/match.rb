class Match < ApplicationRecord
  belongs_to :user
  has_many :attendances

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  SPORTS = %W[Tennis Football Snowboard Hiking Golf Basketball Darts Bowling Beach\ Volleyball]
  LOCATION = %W[Meguro Shibuya Gotanda Ebisu Yoyogi Shinjuku Toyosu Harumi Machida]
  DESCRIPTION = [
    'Hello guys, this is Tomo.
  Let’s enjoy practicing and playing together.
  Your level does not matter.',
    'Hi we are looking for more people to join us. Lets have a fun game and shake out those rusty legs.',
    'Check out this event and see if you are interested. Let’s enjoy practicing and playing together.
    Your level does not matter.'
  ]
end
