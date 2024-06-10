resources :animais, path: 'animais', as: 'animais', path_names: {
  index: '',
  show: 'visualizacao',
  new: 'cadastro',
  edit: 'edicao',
  create: 'cadastro',
  update: 'atualizar',
  destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'animais#create', as: 'create'
    put ':id/edicao', to: 'animais#update', as: 'update'
  end
end