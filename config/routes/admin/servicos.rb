resources :servicos, path: 'servicos', as: 'servicos', path_names: { 
  index: '',
  show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'servicos#create', as: 'create'
    put ':id/edicao', to: 'servicos#update', as: 'update'
  end
end