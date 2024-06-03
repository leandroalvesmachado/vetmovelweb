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

  namespace :admin, path: 'administracao' do
    root 'home#index'

    resources :antipulgas, path: 'antipulgas', as: 'antipulgas', path_names: { 
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'antipulgas#create', as: 'create'
        put ':id/edicao', to: 'antipulgas#update', as: 'update'
      end
    end
    
    resources :cirurgias, path: 'cirurgias', as: 'cirurgias', path_names: { 
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'cirurgias#create', as: 'create'
        put ':id/edicao', to: 'cirurgias#update', as: 'update'
      end
    end

    resources :especies, path: 'especies', as: 'especies', path_names: {
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'especies#create', as: 'create'
        put ':id/edicao', to: 'especies#update', as: 'update'
      end
    end

    resources :exames, path: 'exames', as: 'exames', path_names: { 
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'exames#create', as: 'create'
        put ':id/edicao', to: 'exames#update', as: 'update'
      end
    end

    resources :racas, path: 'racas', as: 'racas', path_names: { 
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'racas#create', as: 'create'
        put ':id/edicao', to: 'racas#update', as: 'update'
      end
    end

    resources :vacinas, path: 'vacinas', as: 'vacinas', path_names: { 
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'vacinas#create', as: 'create'
        put ':id/edicao', to: 'vacinas#update', as: 'update'
      end
    end

    resources :vermifugos, path: 'vermifugos', as: 'vermifugos', path_names: { 
      index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
    } do
      collection do
        post '/cadastro', to: 'vermifugos#create', as: 'create'
        put ':id/edicao', to: 'vermifugos#update', as: 'update'
      end
    end
  end
end
