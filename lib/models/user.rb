class User < ActiveRecord::Base
  has_many :favorites
  has_many :recipes, through: :favorites

  def self.user_valid(username)
    if User.find_by(username: username)
      # binding.pry
      puts "sorry! that username has been taken!, try again!"
      register()
      return false
    end
    true
  end

  def self.register
    prompt = TTY::Prompt.new
    name = prompt.ask("What's your name?")
    last_name = prompt.ask("What's your last name?")
    full_name = name + " " + last_name
    username = name[0] + last_name
    validate = user_valid(username)
    custom_username = prompt.ask ("Your default username is #{username}. Would you like to customize it?")
    custom_username.downcase!
    if custom_username == "y" || custom_username == "yes"
      username = prompt.ask("What is your desired username?")
      validate = user_valid(username)
      if !validate
        password = prompt.mask("Enter desired password", echo: false)
        puts "your account has been created! Now, please log in!"
        return User.create(username: username, name: full_name)
      end
    end
    if custom_username == "no" || custom_username == "n"
      password = prompt.mask("Enter desired password", echo: false)
      sleep 1
      puts "Your account has been created"
      sleep 1
      return User.create(username: username, name: full_name)
    end
  end

  def self.login
    user = nil
    prompt = TTY::Prompt.new
    puts "Welcome back!"
    username = prompt.ask("Please enter your username?")
    password = prompt.mask("Please enter your password", echo: false)
    found_user = User.all.find_by(username: username)
    if found_user
      puts "Welcome back to Smoodie, #{found_user.name}"
      user = found_user
    elsif !found_user
      puts " :(Sorry! that name does not exist in our database"
      sleep 3
      system "clear"
      sleep 1
      prompt_login = prompt.select("Would you like to try again or Register?", %w(Login Register))
      puts "loading......................................."
      sleep 2
      if prompt_login == "Login"
        login()
      elsif prompt_login == "Register"
        register()
      end
    end
    user
  end

  def self.display_smoothie_info(recipe)
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

  # refactor below to use map to get simple name if p
end

# user 16 tbrakus
