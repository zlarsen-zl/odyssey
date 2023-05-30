Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  get "/about_me", to: "landing_pages#about_me", as: :landing_page_about_me
  # Defines the root path route ("/")
  root "blog_posts#index"
end
