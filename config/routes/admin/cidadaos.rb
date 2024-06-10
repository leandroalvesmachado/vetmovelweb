resources :cidadaos, path: 'cidadaos', as: 'cidadaos', path_names: { 
  index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'cidadaos#create', as: 'create'
    put ':id/edicao', to: 'cidadaos#update', as: 'update'
  end

  resources :animais, path: 'animais', as: 'animais', controller: 'cidadaos_animais', path_names: {
    index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
  } do
    collection do
      post '/cadastro', to: 'cidadaos_animais#create', as: 'create'
      put ':id/edicao', to: 'cidadaos_animais#update', as: 'update'
      # get ':id/imagens/cadastro', to: 'animais#new_image', as: 'new_image'
      # put ':id/imagens/cadastro', to: 'animais#create_image', as: 'create_image'
    end
  end
end