Rails.application.routes.draw do

  # Home controller routes.
  root "home#index"
  get "auth" => "home#auth"

  # Get login token from Knock
  post "user_token" => "user_token#create"

  # User actions
  get "/users" => "users#index"
  get "/users/current" => "users#current"
  post "/users/create" => "users#create"
  patch "/user/:id" => "users#update"
  delete "/user/:id" => "users#destroy"

  post "/invoice/cancel/:id" => "invoices#cancel"

  resources :invoices

  get "invoice/:invoice_id/payments" => "invoice_payments#index"
  post "invoice/:invoice_id/payments" => "invoice_payments#create"
end
