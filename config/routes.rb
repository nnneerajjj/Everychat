Rails.application.routes.draw do
  get    'sign_in'      => 'users/sessions#new',     as: 'new_user_session'
  post   'authenticate' => 'users/sessions#create',  as: 'create_user_session'
  delete 'sign_out'     => 'users/sessions#destroy', as: 'destroy_user_session'

  get    'users/new'         => 'users/registrations#new',     as: 'new_user_registration'
  post   'users/create'      => 'users/registrations#create',  as: 'create_user_registration'
  get    'users/:id/edit'    => 'users/registrations#edit',    as: 'edit_user_registration'
  put    'users/:id/update'  => 'users/registrations#update',  as: 'update_user_registration'
  delete 'users/:id/destroy' => 'users/registrations#destroy', as: 'destroy_user_registration'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
