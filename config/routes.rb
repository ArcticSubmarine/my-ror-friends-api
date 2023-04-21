Rails.application.routes.draw do
  resources :friends do
    resources :dogs
  end
end
