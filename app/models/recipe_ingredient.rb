class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, :foreign_key => "recipe_id"
end
