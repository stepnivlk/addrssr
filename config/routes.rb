require 'api_constraints'

Rails.application.routes.draw do
  scope module: :api do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do

      resources :organisations do
        resources :users
        resources :contacts
      end
      post 'user_token' => 'user_token#create'

    end
  end
end
