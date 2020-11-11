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
  email: 'test@dummy.com',
  password: 'password',
  nickname: 'test',
)

puts "...created #{User.count} users!"

puts "creating matches..."

SPORTS = %W[Tennis Football Snowboard Hiking Golf Basketball]
LOCATION = %W[Meguro Shibuya Gotanda Ebisu Yoyogi]
5.times do
  Match.create!(
    user_id: rand(User.first.id..User.last.id),
    date: Date.today + rand(5..10),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    location: LOCATION.sample,
    sport: SPORTS.sample,
    min_attendent: rand(1..2),
    max_attendent: rand(3..10)
  )
end

puts "...created #{Match.count} matches!"
