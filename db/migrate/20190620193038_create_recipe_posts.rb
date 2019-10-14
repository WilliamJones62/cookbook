class CreateRecipePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_posts do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :body

      t.timestamps
    end
  end
end
