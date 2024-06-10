resources :vermifugos, path: 'vermifugos', as: 'vermifugos', path_names: { 
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'vermifugos#create', as: 'create'
    put ':id/edicao', to: 'vermifugos#update', as: 'update'
  end
end