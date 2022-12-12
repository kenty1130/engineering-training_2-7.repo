Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "footsteps#index"
  resources :footsteps do
    resources :favos, only: [:create, :destroy]
  end
  resources :groups do
    # delete "leave" => "groups#leave"
    put :leave,  on: :member
  end

end
