Rails.application.routes.draw do
  # for sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :contact_log_failures
  resources :file_logs
  resources :contacts do
    collection do
      post :import
    end
  end
  devise_for :users
  root 'contacts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
