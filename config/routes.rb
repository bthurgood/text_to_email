Rails.application.routes.draw do

   root 'welcome#index'
   post '/text-to-email', to: "welcome#text_to_email", as: :text_to_email

end
