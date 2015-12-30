Rails.application.routes.draw do

  root 'welcome#index'
  post '/forward-email/:id', to: 'welcome#text_to_email', as: :forward_email

  resources :accounts

  get "/admin" => "clearance/sessions#new", as: "sign_in"
  delete "/sign-out" => "clearance/sessions#destroy", as: "sign_out"
  resource :session, controller: "clearance/sessions", only: [:create]

end
