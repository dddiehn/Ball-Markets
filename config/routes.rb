Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :leagues do
    member do
      get 'graph_data'
    end

    resources :teams do
      resources :team_weeks do

      end
    end
  end

end
