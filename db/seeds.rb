User.destroy_all
Mood.destroy_all
Recipe.destroy_all
Favorite.destroy_all
require "faker"

def seed_names
  50.times do
    name = Faker::Name.unique.first_name
    last = Faker::Name.unique.last_name
    full_name = name + " " + last
    username = name[0] + last
    username.downcase!
    User.create(username: username, name: full_name)
  end
end

seed_names()

puts "done seeing .........."
