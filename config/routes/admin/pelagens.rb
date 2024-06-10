resources :pelagens, path: 'pelagens', as: 'pelagens', path_names: { 
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'pelagens#create', as: 'create'
    put ':id/edicao', to: 'pelagens#update', as: 'update'
  end
end