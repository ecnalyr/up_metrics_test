Rails.application.routes.draw do

  scope '/api' do
    resources :organizations do
      member do
        resources :teams
      end
    end

    resources :participations
    resources :sports
    resources :sports_interests
    resources :teams
    resources :users do
      member do
        resources :participations
        resources :sports_interests
        resources :teams
      end
    end

    scope '/consumer' do
      resources :users do
        member do
          resources :participations
        end
      end
    end
  end
end
