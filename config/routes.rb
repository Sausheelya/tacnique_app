Rails.application.routes.draw do
  get 'quizzes/index'
  get 'quizzes/take'
  get 'quizzes/submit'
  get 'quizzes/results'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'quizzes#index'

  resources :quizzes, only: [] do 
    member do 
     get :take
     post :submit
     get :results
    end
  end
end
