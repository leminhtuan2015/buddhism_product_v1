Rails.application.routes.draw do
  get 'sessions/new'
  root 'homes#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'

  resources :homes

  resources :newfeeds

  resources :banners

  resources :users do
  end

  resources :news do
  end

  resources :article_stores do
    resources :articles
  end

  resources :book_stores do
    resources :books
  end

  resources :lecture_stores do
    resources :lectures
  end

  resources :rule_stores do
    resources :rules
  end

  resources :photo_stores do
    resources :albums do
      resources :photos
    end
  end

  resources :others do
    resources :other_items do
      resources :other_item_details
    end
  end

end