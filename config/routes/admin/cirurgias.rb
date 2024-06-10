resources :cirurgias, path: 'cirurgias', as: 'cirurgias', path_names: { 
  index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'cirurgias#create', as: 'create'
    put ':id/edicao', to: 'cirurgias#update', as: 'update'
  end
end