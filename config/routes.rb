Rails.application.routes.draw do
  #resources :houses
  resources :friends do
    resources :dogs
  end
end
