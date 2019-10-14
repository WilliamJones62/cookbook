class AddTitleToRecipeImages < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_images, :title, :string
  end
end
