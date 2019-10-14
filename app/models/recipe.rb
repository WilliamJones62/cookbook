class Recipe < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_many :recipe_images, inverse_of: :recipe, :dependent => :destroy
  has_many :recipe_ingredients, inverse_of: :recipe, :dependent => :destroy
  has_many :recipe_posts, inverse_of: :recipe, :dependent => :destroy
  has_many :users, through: :recipe_posts

  accepts_nested_attributes_for :recipe_images
  accepts_nested_attributes_for :recipe_ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :recipe_posts, reject_if: proc { |attributes| attributes['body'].blank? }

  validates :title, presence: true
end
