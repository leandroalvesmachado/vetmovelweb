resources :usuarios, path: 'usuarios', as: 'usuarios', path_names: { 
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'usuarios#create', as: 'create'
    put ':id/edicao', to: 'usuarios#update', as: 'update'
  end
end