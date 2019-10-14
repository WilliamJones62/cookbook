class RecipePost < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :recipe, :foreign_key => "recipe_id"

  validates :body, presence: true

  def send_notifications!
    users = recipe.users.uniq - [user]
    users.each do |user|
      NotificationMailer.recipe_post_notification(user, self).deliver_later
    end
  end
end
