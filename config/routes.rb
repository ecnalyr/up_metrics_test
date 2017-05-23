Rails.application.routes.draw do
  scope '/api' do
    resources :sports
    resources :users
  end
end
