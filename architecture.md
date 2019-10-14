# Datatables
1. User - Devise

  email:string
  password:string
  name:string - name to appear on the recipes and posts, can be real or pseudonym
  marketing:boolean - agree to receive email marketing

  has_many :recipes
  has_many :recipe_posts

2. Recipe - Only admin and author/user can update the recipe

  user-id:integer
  title:string
  published:boolean - controlled by administrator. Only published recipes appear in cookbook for all users. Individual users can see their own unpublished recipes.
  instructions:text

  belongs_to :user
  has_many :recipe_posts
  has_many :recipe_images
  has_many :recipe_ingredients

3. RecipePost

  user_id:integer
  recipe_id:integer
  body:text

  belongs_to :user
  belongs_to :recipe

4. RecipeImage

  recipe_id:integer
  image:string

  belongs_to :recipe

5. RecipeIngredient

  recipe_id:integer
  name:string
  quantity:decimal
  uom:string

  belongs_to :recipe
