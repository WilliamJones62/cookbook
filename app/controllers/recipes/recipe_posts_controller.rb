class Recipes::RecipePostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe

  def create
    @recipe_post = @recipe.recipe_posts.new recipe_post_params
    @recipe_post.user = current_user

    if @recipe_post.save
      @recipe_post.send_notifications!
      redirect_to recipe_path(@recipe, anchor: "recipe_post_#{@recipe_post.id}"), notice: "Successfully posted!"
    else
      redirect_to @recipe, alert: "Unable to save your post"
    end
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def recipe_post_params
      params.require(:recipe_post).permit(:body)
    end
end
