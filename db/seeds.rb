# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all the Attendences..."

Attendance.destroy_all

puts "destroying all the matches..."

Match.destroy_all

puts "destroying all the users..."

User.destroy_all

puts "creating users..."

User.create!(
  email: 'hwyann@gmail.com',
  password: 'password',
  nickname: 'jess',
)

User.create!(
  email: 'tomo.l.norman@gmail.com',
  password: 'password',
  nickname: 'tomonorman',
)

User.create!(
  email: 'taku@gmail.com',
  password: 'password',
  nickname: 'taku',
)

puts "...created #{User.count} users!"

puts "creating matches..."

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

15.times do
  Match.create!(
    user_id: rand(User.first.id..User.last.id),
    date: DateTime.new(2020, rand(11..12), rand(1..28), rand(10..20), 0, 0),
    description: DESCRIPTION.sample,
    location: LOCATION.sample,
    sport: SPORTS.sample,
    min_attendent: rand(1..2),
    max_attendent: rand(3..10)
  )
end

puts "...created #{Match.count} matches!"
