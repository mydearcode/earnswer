Rails.application.routes.draw do
  
  resources :activities
  resources :app_settings
  get 'app_settings/update'
  resources :surveys
  resources :surveys do
      put 'publish'
      put 'finish'
      put 'disburse'
    post :create_response
    resources :polls do
    resources :options
      end
  end
  
    post 'authenticate', to: 'authentication#authenticate'
  #resources :answers
  
  resources :questions do
      put 'publish'
      put 'finish'
      put 'good_answer'
      put 'disburse'
      resources :answers do
          member do
            patch 'select_best_answer'
            put 'good_answer'
     end
    end
  end
  
  get 'solved_questions', to: 'questions#solved_questions'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
