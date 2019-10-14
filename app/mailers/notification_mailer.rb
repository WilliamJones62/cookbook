class NotificationMailer < ApplicationMailer
  default from: "billj@dartagnan.com"

  def recipe_post_notification(user, recipe_post)
    @user = user
    @recipe_post = recipe_post

    mail(
      to: "#{user.email}",
      subject: "[D'Artagnan] New post in #{recipe_post.recipe.title}"
    )
  end
end
