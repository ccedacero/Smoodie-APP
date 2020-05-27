class Interface
  attr_accessor :prompt, :user

  def initialize
    @prompt = TTY::Prompt.new
  end

  def welcome
    puts "Welcome to Smoodie!"
    sleep 1
    puts "........................." * 2
    sleep 1
    puts "Before giving you our secret smoothie recipes, we need you to login."
  end

  def chooose_login_or_register
    log_in_answer = prompt.select("Choose an option?", %w(Login Register))
    if log_in_answer == "Login"
      User.login
    elsif log_in_answer == "Register"
      User.register
    end
  end

  # def main_menu
  # puts "Hello, welcome to the app,! #{user.username}"
  # puts "You have #{"
  # end

  def cl
    system "clear"
  end

  def display
    mood_list = Mood.all.map { |mood| mood.mood }
    user_mood = prompt.select("Please choose your mood, and we'll recommend a smoothie?", (mood_list))
    user_mood = Mood.find_by(mood: user_mood)
    cl()
    # puts "loading................." * 3
    # puts "loading................." * 3
    # sleep 2
    recipes = user_mood.recipes
    list_smoothies(recipes)
  end

  def list_smoothies(recipes)
    user_smoothie_choices = recipes.map { |recipe| recipe.name_of_recipe }
    puts "Based on your mood, you may like one of our smoothies below"
    user_choice = prompt.select("Please choose one to see the secret recipe:", (user_smoothie_choices))
    smoothie_recipe = recipes.find_by(name_of_recipe: user_choice)
    display_smoothie_info(smoothie_recipe)
    additiona_choice = prompt.select("What would you like to do next?", %W(GO_BACK EXIT))
    if additiona_choice == "GO_BACK"
      list_smoothies(recipes)
    elsif additiona_choice == "EXIT"
      puts "GOOD BYE!.............." + "\n" + "ENJOY YOUR SMOOTHIE!"
    end
  end

  def display_smoothie_info(recipe)
    # recipes.each do |recipe|
    # binding.pry
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
    # end
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
