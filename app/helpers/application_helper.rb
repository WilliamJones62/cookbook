module ApplicationHelper
  def user_avatar(user, size=40)
    # if !user.image.blank?
    #   user.image
    # else
      gravatar_image_url(user.email, size: size)
    # end
  end
end
