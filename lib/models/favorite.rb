# frozen_string_literal: true

class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  def self.add_to_favorite(user)
    prompt = TTY::Prompt.new
    user_smoothie_choices = Recipe.all.map(&:name_of_recipe)
    user_choice = prompt.select("choose the smoothie you'd like to add to your favorites:", user_smoothie_choices)
    smoothie_id = Recipe.find_by(name_of_recipe: user_choice).id
    Favorite.create(recipe_id: smoothie_id, user_id: user.id)
    puts "You've added #{user_choice} to your favorite's list!"
    sleep 2
  end
end
