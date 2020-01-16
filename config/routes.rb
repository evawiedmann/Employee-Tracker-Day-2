
Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :individuals do
    resources :projects
  end
  resources :projects do
    resources :individuals
  end
  resources :divisions do
    resources :individuals do
    end
  end
end
