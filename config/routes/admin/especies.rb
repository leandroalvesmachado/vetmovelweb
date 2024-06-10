resources :especies, path: 'especies', as: 'especies', path_names: {
  index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'especies#create', as: 'create'
    put ':id/edicao', to: 'especies#update', as: 'update'
  end
end