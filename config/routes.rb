Rails.application.routes.draw do
  root "static_pages#home"
  get "/blog", to: "static_pages#blog"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  # get "/detail_pitch", to: "static_pages#detail_pitch"
end
