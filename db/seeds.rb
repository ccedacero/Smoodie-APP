Mood.destroy_all
MoodRecipe.destroy_all
Recipe.destroy_all
Favorite.destroy_all
User.destroy_all

require "faker"

def seed_names
  10.times do
    name = Faker::Name.unique.first_name
    last = Faker::Name.unique.last_name
    full_name = name + " " + last
    username = name[0] + last
    username.downcase!
    User.create(username: username, name: full_name)
  end
end

seed_names()

recipe_hash = {
  :happy => [
    ["A Very Cheery Smoothie", "pineapple, plain Greek Yogurt , ground turmeric, ground cinnamon,raw hemp seeds", "Cheer up and get moving with this happy smoothie!", "calories based on serving amount"],
    ["Daily Warrior", "banana,blueberries(Wild), apples, dates, peanut butter,almonds, stevia plant based Sweetener, organic Spinach", "Blueberries are known to improve mental health, apples contain antioxidants, the Daily Warrior is packed with nutrients that may boost your heart, brain and digestive health to keep you pushing through. You are a warrior!", "calories based on serving amount"],
  ],

  :romantic => [
    ["Mint To Be", "mint leaves, mango, apple, strawberry, lime juice, passionfruit", "Keep things fresh! You and good health are mint to be.Passionfruit because what is romance without passion?", "calories based on serving amount"],
    ["Sweetheart", "strawberries, honey, choice of milk, vanilla extract, chocolate chunks", "A nice portion of The Sweetheart will have you ready to snuggle after. Enjoy with a loved one!", "calories based on serving amount"],
  ],

  :calm_chill => [["High Times", "option of oat seed or oat milk, kale, coconut butter, preferred brand CBD oil, mint(optional), honey", "CBD derives from the hemp plant and contains an abundance of anti-flammatory properties but none of the psychotropic effects, so don't expect to get high. Just expect to feel good. Stay calm high times ahead.", "calories based on serving amount"],
                  ["Zen Colada", "banana, pineapple,coconut meat,coconut oil, honey, maca, lemon, oat milk", "A mind not fixed or occupied by thought or emotion is zen mode. That mind is open to everything", "calories based on serving amount"]],

  :peaceful => [
    ["Green Peace", "spinach, pineapple, coconut water, avocado, spirulina, mint leaves, hemp seeds, honey, lemon", "Spirulina is a very concentrated  source of vitamins and minerals that help detoxify and alkalize the body. The body deserves peace and love", "calories based on serving amount"],
    ["Peachy", "sliced peaches, grated ginger, spinach,brown sugar", "No worries.No cares. Things are peachy.", "calories based on serving amount"],
  ],

  :restless => [
    ["Bedtime Zzz", "kiwi, banana, cold chamomile tea,almond milk, maple syrup, almond butter", "Kiwi increases melatonin and is high in serotonin, a hormone that helps you sleep through the night. Can't sleep? This is your key to some Zzz's"],
    ["Melatonin Boost", "almond coconut milk, frozen pineapple chunks, banana, mint leaves,liquid stevia", "You can count sheep or you can enjoy this delicious smoothie to fall asleep!", "calories based on serving amount"],
  ],

  :sluggish => [
    ["The Antoxidant", "cold green tea, honey, blueberries, banana, soymilk", "Feeling sluggish? This nutritional smoothie will spring you up!", "calories based on serving amount"],
    ["The Energizer", "mango, banana, blueberries, chia seeds, honey, greek yogurt", "The honey in this smoothie acts as a time-released muscle fuel, an energy booster perfect for the start of a busy day", "calories based on serving amount"],
  ],

  :joyful => [
    ["Oh Happy Day", "bananas, chopped pineapple, cut mango, coconut water,dash of ground allspice, honey", "And live rejoicing every, everyday", "calories based on serving amount"],
    ["Positive Vibration", "orange juice, raspberries, pineapples, spinach, yogurt, sweetener of choice", "Good Vibes Only", "calories based on serving amount"],
  ],

  :powerful => [
    ["The Hulk", "protein powder, banana, strawberries, vanilla yogurt, honey, pinch of cinnamon", "You're powerful and INCREDIBLE", "calories based on serving amount"],
    ["BO$$Y", "blueberries, straeberries, banana, vanilla yogurt, almond butter", "Feeling like the Boss?", "calories based on serving amount"],
  ],

  :apologetic => [
    ["Sorry, Ms.Jackson", "frozen blueberries, chopped pear, maple or plain yogurt, sugar to taste", "I apologize a trillion times...", "calories based on serving amount"],
    ["Apologetic", "chopped honeydew melon, almond milk, honey to taste", "Is it too late now to say sorry?", "calories based on serving amount"],
  ],

  :bitter => [

   ["Strawberry Shortcake", "strawberries, crumbled pound cake, milk, chocolate chips", "Sweeten Up!","calories based on serving amount" ],
   ["GLAD", "orange juice, raspberries, plain yogurt, sugar to taste", "Don't get mad, get Glad", "calories based on serving amount"]
   ] 
  }
 
Mood.destroy_all

recipe_hash.each do |k, v|
  i = 0
  if i == 0
    mood = Mood.create(mood: k.to_s)
  end
  # v.each do |recipe|
  if k == :happy || k == :calm_chill || k == :romantic || k == :peaceful || k == :restless || k == :sluggish || k == :joyful || k == :powerful || k == :apologetic || k == :bitter && i == 0
    recipe = Recipe.create(name_of_recipe: v[0][0], ingredients: v[0][1], description: v[0][2], calories: v[0][3])
    MoodRecipe.create(mood_id: mood.id, recipe_id: recipe.id)
    i += 1
    # end
    # end
  end
  # binding.pry
  if k == :happy || k == :calm_chill || k == :romantic || k == :peaceful || k == :restless || k == :sluggish || k == :joyful || k == :powerful || k == :apologetic || k == :bitter && i == 1
    # created = Recipe.all.find_by(name_of_recipe: v[1][0]).name_of_recipe
    # if created == nil
    recipe = Recipe.create(name_of_recipe: v[1][0], ingredients: v[1][1], description: v[1][2], calories: v[1][3])
    MoodRecipe.create(mood_id: mood.id, recipe_id: recipe.id)
    i += 1
    # end
    # end
  end
end

def gen_10_nums
  arr = []
  while arr.size < 10
    arr << rand(0..9)
    arr.uniq!
  end
  arr
end

i = 0
10.times do
  arr = gen_10_nums()
  # binding.pry
  recipe = Recipe.all.map { |recipe| recipe.id }
  # binding.pry
  users = User.all.map { |user| user.id }
  Favorite.create(user_id: users[arr[i]], recipe_id: recipe[arr[i]])
  i += 1
end

puts "done seeing"
