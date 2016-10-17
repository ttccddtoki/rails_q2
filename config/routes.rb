Rails.application.routes.draw do
  devise_for :users
  resources :results, only: [:index]
  post "questions/next_question", to: "questions#next_question", as: "next_question"
  resources :answer_lists, only: [:index]
  resources :questions, only: [:index]
end
