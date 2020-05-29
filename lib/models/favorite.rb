class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  def self.add_to_favorite(user)
    prompt = TTY::Prompt.new
    user_smoothie_choices = Recipe.all.map { |recipe| recipe.name_of_recipe }
    user_choice = prompt.select("choose the smoothie you'd like to add to your favorites:", (user_smoothie_choices))
    id = Recipe.find_by(name_of_recipe: user_choice).id
    binding.pry
    Favorite.create(recipe_id: id, user_id: user.id)
    puts "You've added #{user_choice} to your favorite's list!"
    sleep 2
  end
end

# tbrakus

# another joined table, a user has a favorite and that
# favorite points to one recipe.
# same relationship as moods
# recipe and use has
# multiple dif relationships with the same models/class
