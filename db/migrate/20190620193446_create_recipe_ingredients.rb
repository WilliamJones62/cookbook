class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.string :name
      t.decimal :quantity
      t.string :uom

      t.timestamps
    end
  end
end
