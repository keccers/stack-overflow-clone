DbcOverflow::Application.routes.draw do
  resources :question do
    resource :comments
    resource :answers
    resource :votes
  end

  resources :answers do
    resource :comments
    resource :votes
  end

  resources :comments do
    resource :votes
  end

  resources :users

  root :to => "question#index"
end
