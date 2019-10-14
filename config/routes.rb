Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :recipes do
    resources :recipe_posts, module: :recipes
    resources :recipe_images, except: [:index, :show]
    resources :recipe_ingredients, except: [:index, :show]
  end
  root 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
