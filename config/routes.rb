AdventureLibrary::Application.routes.draw do
  resources :adventures do
    resources :pages
  end
end
