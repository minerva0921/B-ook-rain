Rails.application.routes.draw do
  resources :books
  
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }

  resource :users

  root to: 'homes#top'
  get 'about' => 'homes#about'

end
