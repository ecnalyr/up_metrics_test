Rails.application.routes.draw do
  scope '/api' do
    resources :sports
  end
end
