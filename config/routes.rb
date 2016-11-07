Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "questions", controller: 'questions', action: 'show', id: '1'
  resources :results, only: [:index]
  resources :answer_lists, only: [:index]
  resources :questions, only: [:index, :show, :update]
  resources :result_lists, only: [:index]
end
