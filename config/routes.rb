Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, only: %i[index show new create destroy] do
    resources :bookmarks, only: %i[index new create]
  end
  resources :bookmarks, only: [:destroy]
end

# need to do the html and css of the cards banner for the list
