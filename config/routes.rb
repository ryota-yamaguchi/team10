# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :projects do

    get 'team10', :to => 'team10#index'

    namespace :team10 do
      resources :room, controller: '/room'
    end

  end


end
