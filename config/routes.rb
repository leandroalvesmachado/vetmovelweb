Rails.application.routes.draw do
  # devise_for :usuarios
  
  # Configurar Devise para o modelo User (ou Usuario, caso tenha mudado o nome)
  devise_for :usuarios, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'sair',
    password: 'senha',
    confirmation: 'confirmacao',
    unlock: 'desbloquear',
    registration: 'registro',
    sign_up: 'cadastro'
  }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'admin/home#index'

  draw :admin # Loads `config/routes/admin.rb`
end
