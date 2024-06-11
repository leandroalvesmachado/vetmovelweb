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

  resources :imagens, path: 'imagens', as: 'imagens', controller: 'animais_imagens', path_names: {
    index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
  } do
    collection do
      post '/cadastro', to: 'animais_imagens#create', as: 'create'
      put ':id/edicao', to: 'animais_imagens#update', as: 'update'
    end
  end
end