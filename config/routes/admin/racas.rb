resources :racas, path: 'racas', as: 'racas', path_names: { 
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'racas#create', as: 'create'
    put ':id/edicao', to: 'racas#update', as: 'update'
  end
end