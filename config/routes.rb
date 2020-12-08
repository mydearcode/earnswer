Rails.application.routes.draw do
  resources :answers
  get 'solved_questions', to: 'questions#solved_questions'
  resources :questions do
      
      resources :answers do
          member do
      patch 'select_best_answer'
     end
    end
  end
    post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
