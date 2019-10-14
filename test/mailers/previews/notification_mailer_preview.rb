# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def recipe_post_notification
    NotificationMailer.recipe_post_notification(User.first, RecipePost.first).deliver_now
  end
end
