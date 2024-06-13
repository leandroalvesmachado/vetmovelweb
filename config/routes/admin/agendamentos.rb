resources :agendamentos, path: 'agendamentos', as: 'agendamentos', path_names: { 
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'agendamentos#create', as: 'create'
    put ':id/edicao', to: 'agendamentos#update', as: 'update'
  end
end