namespace :admin, path: 'administracao' do
  resources :antipulgas, path: 'antipulgas', as: 'antipulgas', path_names: { 
    index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
  } do
    collection do
      post '/cadastro', to: 'antipulgas#create', as: 'create'
      put ':id/edicao', to: 'antipulgas#update', as: 'update'
    end
  end
end