Rails.application.routes.draw do
  resources :users
  resource :session
  resources :bands

  MusicApp::Application.routes.draw do
    resources :bands do
      resources :albums, only: :new
    end
    resources :albums, only: [:create, :edit, :show, :update, :destroy]
  end

  MusicApp::Application.routes.draw do
    resources :albums do
      resources :tracks, only: :new
    end
    resources :tracks, only: [:create, :edit, :show, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
