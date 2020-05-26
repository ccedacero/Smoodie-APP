User.destroy_all
Mood.destroy_all
Recipe.destroy_all
Favorite.destroy_all

require "faker"
# 8 users
def seed_names
  8.times do
    name = Faker::Name.unique.first_name
    last = Faker::Name.unique.last_name
    full_name = name + " " + last
    username = name[0] + last
    username.downcase!
    User.create(username: username, name: full_name)
  end
end

seed_names()

def seed_recipe
  recipe = ["Daily Warrior", "1 Banana 1 cup Blueberries (Wild), 2 Apples, 1/4 cup Dates, 2 tbsp Peanut Butter, 2 tbsp Almonds, Stevia Plant-Based Sweetener, Handful Spinach - Organic", "Feeling like you need motivation? Make yourself a Daily Warrior with fruits like blueberries which are known to improve mental health, and apples containing antioxidants, vitamin C, fiber, and several other nutrients that may boost heart, brain, and digestive health designed to help you push on through.You got this. You're a warrior!", 680]
  Recipe.create(name_of_recipe: recipe[0], ingredients: recipe[1], description: recipe[2], calories: recipe[3])
  # recipe = ["Daily Happy", "1 Banana 1 cup Blueberries (Wild), 2 Apples, 1/4 cup Dates, 2 tbsp Peanut Butter, 2 tbsp Almonds, Stevia Plant-Based Sweetener, Handful Spinach - Organic", "Feeling like you need motivation? Make yourself a Daily Warrior with fruits like blueberries which are known to improve mental health, and apples containing antioxidants, vitamin C, fiber, and several other nutrients that may boost heart, brain, and digestive health designed to help you push on through.You got this. You're a warrior!", 900]
  # Recipe.create(name_of_recipe: recipe[0], ingredients: recipe[1], description: recipe[2], calories: recipe[3])
end

seed_recipe()

# 8 moods
def seed_moods
  moods = ["Unmotivated"]
  # moods = ["Unmotivated", "Romantic", "Calm / Chill", "Peaceful", "Restless", "Tired", "Sluggi]
  moods.each do |mood|
    Mood.create(mood: mood, recipe_id: Recipe.first)
  end
end

seed_moods()

puts "done seeing .........."
