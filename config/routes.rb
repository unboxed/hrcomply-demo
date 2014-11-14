Rails.application.routes.draw do
  root to: redirect('/employees')
  resources :employees, except: [:show]
end
