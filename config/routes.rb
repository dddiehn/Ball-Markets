Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :leagues do
    resources :teams do

    end
  end

end
