resources :vacinas, path: 'vacinas', as: 'vacinas', path_names: { 
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'vacinas#create', as: 'create'
    put ':id/edicao', to: 'vacinas#update', as: 'update'
  end
end