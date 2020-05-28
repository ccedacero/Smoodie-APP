class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  def display_favorites(user)
    binding.pry
    self.all.find_by(username: user.username)
  end
end

# another joined table, a user has a favorite and that
# favorite points to one recipe.
# same relationship as moods
# recipe and use has
# multiple dif relationships with the same models/class
