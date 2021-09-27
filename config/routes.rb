Rails.application.routes.draw do

  root to:'components#home'
  resources :projects


  #user generales routes
  devise_for :users, controllers: {
      'registrations': 'registrations',
      'sessions':      'sessions',
      'passwords':     'passwords'
  }
  resources :users, only: %i[show index update]


  # user comment
  post 'users/comments/:id', to:'users#comment', as: :user_comment
  get 'users/comments/:id', to:'users#edit_comment', as: :edit_user_comment
  patch 'users/comments/:id', to:'users#update_comment', as: :update_user_comment


 #conversations routes
  post '/create_conversation/:id', to:"components#create_conversation"
  resources :conversations do
    resources :messages
  end


  #meetings routes
  post '/meeting/:id', to:"components#create_meeting"
  get  'components/meeting/:id', to:"components#meeting"
  get  'components/meetings', to:"components#meetings"


  # components routes
  get 'components/dashboard'
  get 'components/icons'
  get 'components/profile'
  get 'components/tables'
  get 'components/login'
  get 'components/register'
  get 'components/upgrade'
  get 'components/index', as: "components"
  get 'components/conversations'
  get 'components/mentor'
  # advisor routes

  get 'advisors/index', to:'advisors#index', as: :advisors_users
  get 'advisors/user/:id',to:'advisors#show', as: :edit_advisors_user
  patch 'advisor/user/:id', to:'advisors#update', as: :update_advisous_user


  # class_room & courses roots
  resources :classrooms
  get "classrooms/:id/courses", to:'classrooms#courses'
  get "components/classrooms", to:"components#classrooms", as: :components_classrooms

  post "classrooms/:id/room", to:"rooms#create", as: :create_room

  mount ActionCable.server => '/cable'

  #bugs routes
  resources :bugs
  mount Ckeditor::Engine => '/ckeditor'
  
end
