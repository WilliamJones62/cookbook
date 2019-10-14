class RecipeImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :recipe, :foreign_key => "recipe_id"
end
