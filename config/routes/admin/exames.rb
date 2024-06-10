resources :exames, path: 'exames', as: 'exames', path_names: { 
  index: '', show: 'visualizacao', new: 'cadastro', edit: 'edicao', create: 'cadastro', update: 'atualizar', destroy: 'excluir'
} do
  collection do
    post '/cadastro', to: 'exames#create', as: 'create'
    put ':id/edicao', to: 'exames#update', as: 'update'
  end
end