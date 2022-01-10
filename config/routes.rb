Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'links', to: 'links#create'
      get 'links/:slug', to: 'links#show'
    end
  end
end
