Rails.application.routes.draw do

  root 'welcome#index'
  post '/text-to-email', to: "welcome#text_to_email", as: :text_to_email

  get "/admin" => "clearance/sessions#new", as: "sign_in"
  delete "/sign-out" => "clearance/sessions#destroy", as: "sign_out"
  resource :session, controller: "clearance/sessions", only: [:create]

end
