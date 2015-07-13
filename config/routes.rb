ImageLibrary::Engine.routes.draw do
  resources :uploads, only: [:create, :destroy, :index], format: :js
end
