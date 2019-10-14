class RecipesController < ApplicationController
  before_action :set_user
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @q = Recipe.search(params[:q])
    @recipes = @q.result(distinct: true)
  end

  def show
  end

  def new
    @new = true
    @recipe = current_user.recipes.new
    @recipe.recipe_images.new title: 'Finished dish'
    @recipe.recipe_images.new title: 'Photo 1'
    @recipe.recipe_images.new title: 'Photo 2'
    @recipe.recipe_images.new title: 'Photo 3'
    @recipe.recipe_images.new title: 'Photo 4'
    20.times { @recipe.recipe_ingredients.new }

  end

  def edit
    i = 20 - @recipe.recipe_ingredients.length
    i.times { @recipe.recipe_ingredients.new }
  end

  def create
    @recipe = current_user.recipes.new recipe_params

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to proc {recipes_path}, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to proc {recipes_path}, notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @recipe_post = RecipePost.new
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
      if @recipe.user.email == current_user.email
        @owner = true
      end
    end

    def set_user
      @user = current_user.email.upcase
      @new = false
      @owner = false
      if !current_user.admin.blank?
        @admin = true
      else
        @admin = false
      end
      @uom = ['cup', 'each', 'lb', 'oz', 'pt', 'Tbsp', 'tsp']
    end

    def recipe_params
      params.require(:recipe).permit(:user_id, :title, :published, :description, :instructions,
        recipe_posts_attributes:
          [
            :id,
            :body
          ],
        recipe_images_attributes:
          [
            :id,
            :image,
            :title
          ],
        recipe_ingredients_attributes:
          [
            :id,
            :name,
            :quantity,
            :uom
            ])
    end
end
