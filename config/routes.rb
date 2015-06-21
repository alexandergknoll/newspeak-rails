Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :headlines

  scope '/api' do
    scope '/v1' do
      scope '/users' do
        scope '/:phone' do
          get '/' => 'api_users#show'
        end
      end
    end
  end
end
