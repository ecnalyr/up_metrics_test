Rails.application.routes.draw do

  scope '/api' do
    resources :sports
    resources :sports_interests
    resources :users do
      member do
        resources :sports_interests
      end
    end
  end
end
