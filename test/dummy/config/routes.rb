Rails.application.routes.draw do
  mount ImageLibrary::Engine => "/"
  get '/examples', to: 'examples#index'
end
