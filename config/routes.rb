Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#view'
  resources :sessions, only:[:new, :create, :destroy] do
    resources :messages
  end
  
end
