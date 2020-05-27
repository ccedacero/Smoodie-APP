Mood.destroy_all
MoodRecipe.destroy_all
Recipe.destroy_all
Favorite.destroy_all
User.destroy_all

require "faker"

# def seed_names
# 3.times do
# name = Faker::Name.unique.first_name
# last = Faker::Name.unique.last_name
# full_name = name + " " + last
# username = name[0] + last
# username.downcase!
# User.create(username: username, name: full_name)
# end
# end
#


 
def seed_moods
#9
moods = [“Happy”, “Romantic”, “Calm / Chill”, “Peaceful”, “Restless”, “Sluggish”,  “Joyful”, “ Powerful”, “Apologetic”] 
end


#  def seed_recipes

  recipe_hash {
happy_recipe  => 
  [ “A Very Cheery Smoothie” ,“1 cup frozen or fresh pineapple, chopped, ¾ cup filtered room temperature water, 5 oz plain Greek, Icelandic, or coconut yogurt, ½ tsp ground turmeric, ½ tsp ground cinnamon,optional goji berries, toasted unsweetened coconut flakes, raw hemp seeds”, “Cheer up and get moving with this hearty and happy smoothie!”, CALORIES : 300”],
  [ "Daily Warrior" , “1 Banana, 1 cup Blueberries (Wild), 2 Apples, 1/4 cup Dates, 2 tbsp Peanut Butter, 2 tbsp Almonds, Stevia Plant-Based Sweetener, Handful Spinach - Organic”, “Feeling like you need motivation? Make yourself a Daily Warrior with fruits like blueberries which are known to improve mental health, and apples containing antioxidants, vitamin C, fiber, and several other nutrients that may boost heart, brain, and digestive health designed to help you push on through.You got this. You are a warrior!”,  “CALORIES : 680”]  ]

romantic_recipe => [ [“Mint To Be”, “¼ cup min leaves ,1 cup chopped mango, 1 apple, 1 cup strawberry,  lime juice from 3 limes , 1 cup passionfruit”, “Keeping Things Fresh. Give physical affection to your loved one. If you are more touchy-feely with your loved one, you are more likely to feel romantic -- and in the mood.Mint can help you relax and ease those butterflies.Passionfruit because what is romance without passion?”, “CALORIES : 525” ] , [ “Sweetheart”, “  strawberries - 1 cup, honey - 2 tbsp,  milk - 1 ½ cup
 vanilla extract - ½ tsp, chocolate chunks - ½ cup,  chocolate sauce for topping”, “The Sweetheart is ready to snuggle. Go to your favorite place and enjoy with your loved one.
”,  “CALORIES : 300”]] 

calm_chill_recipe => [ [ “HIGH TIMES”, “ 1 cup nut or seed or oat milk,Handful of kale or spinach, 1 T Coconut Butter, 1/2 teaspoon of preffered brand CBD oil, couple sprigs of mint, preferred sweetener (optional)”, “CBD is popping up everywhere and with good reason. This powerful ingredient derived from the hemp plant contains an abundance of anti-inflammatory properties but with none the psychotropic effects, so don’t expect to get high. Just expect to feel good. Calm down, high times ahead.”,  “CALORIES : 300”], 
         
[ “Zen Colada”, “ 1 Banana, 1 cup chopped  Pineapple, 1 cup Coconut, 2 tbsp Honey, 1 tbsp Coconut Oil, Coconut Meat, Maca, Lemon, Oat Milk”, “Zen expression meaning the mind without mind and is also referred to as the state of "no-mindedness". That is, a mind not fixed or occupied by thought or emotion and thus open to everything”,  “CALORIES : 300”] ]


peaceful_recipe => [ [ “Green Peace”, “Spinach, pineapple, coconut water, avocado, spirulina, mint leaves, hemp seeds, honey, lemon”, “Spirulina is a very concentrated source of vitamins and minerals and also very detoxifying and alkalizing to the body, which is why it’s considered a “super food” in many circles. It’s a great way to get a green smoothie without adding handfuls of kale. ”,  “CALORIES : 230”], 
 [“Peach-Ginger Blend”, “2 cups frozen sliced peaches, 1 1/2 cups buttermilk, 3 tablespoons brown sugar and 1 tablespoon grated fresh ginger”, “No worries, No cares.Things are peachy. ”, “CALORIES : 360”] ]

restless_recipe => [ [“Bedtime Zzz”, “1 kiwi, peeled and frozen, 1 banana, peeled and frozen, 100 ml chamomile tea, cold, 1/2 cup almond milk, 1 tbsp maple syrup (optional), 1 tbsp almond butter (optional)”, “ Kiwi, who would have thought kiwi can help you fall asleep better? I wouldn’t! But kiwi may be the most melatonin-increasing fruit ever. This little green fruit is high in serotonin, a hormone that helps you sleep and maintain it during the night. This hormone also appears to interact with melatonin, and some studies have shown that higher levels of serotonin increase melatonin levels. Suffering from Insomnia? This is your key to some Zzz’s” “CALORIES: 243”],
 [“Melatonin Boost”, “3/4 c unsweetened almond coconut milk, 1/2 c frozen pineapple chunks, 1/4 banana, frozen, 5 small mint leaves, 2 drops liquid stevia”, “Turns out there are definitely some things you can do to ensure better sleep, and enjoying this delicious smoothie is one of them!”, “CALORIES : 210”] ]

sluggish_recipe => [  [“The Antioxidant”, “3 tpsp water, 1 green tea bag, 2 tbs honey, 1 1/2 cup blueberries, half banana, 3/4 cup of soymilk”, “Feeling a little sluggish? Whip yourself up this antioxidant smoothie! This nutritional powerhouse is bound to keep you so healty you will glow!”, “CALORIES : 200”],
 [“The Energizer”, “1/2 mango, 1/2 banana, 1.2 cup blueberries, 2 tspb chia seeds, 1tbsp honey, 2 tbsp greek yogurt”, “The honey in this smoothie acts as a time-released muscle fuel, and aids all other slow release complex carbs in this little energy booster - just what you will need at the start of a busy day”, “CALORIES : 360”] ]




joyful_recipe => [  “Oh Happy Day”, “ 2 bananas,  1 cup  chopped pineapple, 1 cup cut mango, 1 cup coconut water, a dash of ground allspice and 1 cup ice, 2 teaspoons honey, a pinch of cinnamon and 1 cup ice”, “And live rejoicing every, everyday”,  “CALORIES : 300”],
 [“Positive Vibration” , “1 cup each orange juice and raspberries, 1 cup pineapples, 1 cup spinach, 1/2 cup plain yogurt, 1 cup ice, and sugar to taste”, “Description”, “CALORIES : 360” ] ]
 

powerful_recipe => [“The Hulk”, “2 scoops protein powder, 1 banana, 1 cup strawberries, 1/2 cup each vanilla yogurt and milk, 2 teaspoons honey, a pinch of cinnamon and 1 cup ice”, “You’re powerful and INCREDIBLE”, “CALORIES : 360”], [“BOSSY”, “1 1/2 cups apricot nectar, 1/2 cup vanilla yogurt, 2 tablespoons almond butter and 1 cup ice”, “Feeling like da boss?”, “CALORIES : 360” ] ]

apologetic_recipe => [“Sorry, Ms.Jackson”, “1 1/2 cups frozen blueberries, 1 chopped pear, 1 1/2 cups each maple or plain yogurt and ice, and sugar to taste”, “I apologize a trillion times...”, “CALORIES : 360”], [“Apologetic”, “2 cups chopped honeydew melon, 1 cup each almond milk and ice, and honey to taste”, “Is it too late now to say sorry?”, “CALORIES : 360”]


bitter_mood => [ [“Strawberry Shortcake Blend”, “2 cups strawberries, 1 cup crumbled pound cake, 1 1/2 cups each milk and ice, and sugar to taste. Top with whipped cream and more strawberries”, “Sweeten up”, “CALORIES : 360”], 
[“GLAD”, “1 cup each orange juice and raspberries, 1/2 cup plain yogurt, 1 cup ice, and sugar to taste”, “Don’t get mad,  get Glad”, “CALORIES : 360”] ]
 ] }
 recipe_hash.each do |k, v| 
  p k
  p v
  binding.pry
 end


#  seed_recipe()

def seed_mood_recipes
  mood_ids = Mood.all.collect { |mood| mood.id }
  recipe_ids = Recipe.all.collect { |recipe| recipe.id }

  mood_ids.each_with_index do |m_id, i|
    MoodRecipe.create(mood_id: m_id)
    MoodRecipe.create(recipe_id: recipe_ids[i])
    binding.pry
  end
end

seed_mood_recipes()

favorites_list = “Green Peace”, “A Very Cheery Smoothie”, 


puts "done seeing"  
