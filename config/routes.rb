Rails.application.routes.draw do
  namespace :admin do
    root "pages#home"
  end
  root "static_pages#home"
  get "/blog", to: "static_pages#blog"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
end
