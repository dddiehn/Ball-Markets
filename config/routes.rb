Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :leagues do
    resources :teams do
      resources :team_weeks do

      end
    end
  end

end
