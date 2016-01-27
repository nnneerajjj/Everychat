Rails.application.routes.draw do
  root 'home#index'

  get    'users/sessions/new' => 'users/sessions#new',     as: 'new_user_session'
  post   'users/sessions'     => 'users/sessions#create',  as: 'create_user_session'
  delete 'users/sessions'     => 'users/sessions#destroy', as: 'destroy_user_session'

  resources :users, controller: 'users/registrations', only: %i(new edit create update destroy)

  resources :rooms, only: %i(index show create update destroy) do
    resources :messages, only: %i(create)
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
