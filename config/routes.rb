AdventureLibrary::Application.routes.draw do
  root 'adventures#index'

  resources :adventures do
    resources :pages
  end

  resources :libraries do
    resources :adventures
end
end