Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: %i[index show create]
  end
end
