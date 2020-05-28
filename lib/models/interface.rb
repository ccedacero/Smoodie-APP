class Interface
  attr_accessor :prompt, :user

  def initialize
    @prompt = TTY::Prompt.new
  end

  # To do
  # Need to add back prompt for when  you see Favorite smoothie
  #
  def self.cl()
    system "clear"
  end

  def welcome
    puts "Welcome to Smoodie!"
    sleep 1
    puts "......................................" * 2
    sleep 1
    puts "Before giving you our secret smoothie recipes, we need you to login."
  end

  def chooose_login_or_register
    log_in_answer = prompt.select("Choose an option?", %w(Login Register))
    if log_in_answer == "Login"
      user = User.login
      # loading()
      main_menu(user)
    elsif log_in_answer == "Register"
      User.register
      # loading()
      main_menu(user)
    end
  end

  def main_menu(user)
    # puts "Hello, welcome to Smoodie!"
    #{user.username}
    log_in_greeting = prompt.select("What would you like to do today?", ["My Favorite Recipes", "Get Smoothie Recommendation", "Add Smoothie to Favorites", "Logout"])
    if log_in_greeting == "My Favorite Recipes"
      User.display_favorites(user)
    elsif log_in_greeting == "Recommend a Smoothie"
      display()
    elsif log_in_greeting == "Add Smoothie to Favorites"
      Favorite.add_to_favorite(user)
    elsif log_in_greeting == "Logout"
      puts "Good Bye!"
      puts "Enjoy your smoothie!!"
    end
  end

  def display
    mood_list = Mood.all.map { |mood| mood.mood }
    user_mood = prompt.select("Please choose how you're feeling today, and we'll recommend a smoothie?", (mood_list))
    user_mood = Mood.find_by(mood: user_mood)
    # cl()
    recipes = user_mood.recipes
    # loading()
    list_smoothies(recipes)
  end

  def list_smoothies(recipes)
    user_smoothie_choices = recipes.map { |recipe| recipe.name_of_recipe }
    puts "Based on your mood, you may like one of our smoothies below."
    user_choice = prompt.select("Please choose one to see the secret recipe:", (user_smoothie_choices))
    smoothie_recipe = recipes.find_by(name_of_recipe: user_choice)
    display_smoothie_info(smoothie_recipe)
    additiona_choice = prompt.select("What would you like to do next?", %W(GO_BACK EXIT))
    if additiona_choice == "GO_BACK"
      cl()
      sleep 2
      list_smoothies(recipes)
    elsif additiona_choice == "EXIT"
      puts "GOOD BYE!.............." + "\n" + "ENJOY YOUR SMOOTHIE!"
    end
  end

  def display_smoothie_info(recipe)
    puts "Smoothie Name" + "\n"
    puts recipe.name_of_recipe
    puts "-----------------------------"
    puts "Ingredients" + "\n"
    puts recipe.ingredients
    puts "-----------------------------"
    puts "Description" + "\n"
    puts recipe.description
    puts "-----------------------------"
    puts "Calories" + "\n"
    puts recipe.calories
    puts "-----------------------------"
  end

  def loading
    sleep 1
    puts "loading.........................................................." + "\n"
    sleep 2
    puts "loading............................................." + "\n"
    sleep 3
    puts "loading........." + "\n"
    puts "SMOODIE! :)"
    # puts "loading.................."
    sleep 2
    # cl()
  end
end

# main menu method
# prompt for mood
# get list of moods from moods and display
#
#
# figuring out the seeing
#
# loading method
# puts some loading dots as placerholder
# ...
#
# association method
# it should retrieve the recipe that belongs to that mood
# and siplay all recipe information

# we should have the logout option

# finish the seed assoations
