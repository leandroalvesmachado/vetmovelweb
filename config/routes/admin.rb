namespace :admin, path: 'administracao' do
  root 'home#index'

  # Loads `config/routes/admin/animais.rb`
  draw 'admin/ajax'
  draw 'admin/agendamentos'
  draw 'admin/animais'
  draw 'admin/antipulgas'
  draw 'admin/cidadaos'
  draw 'admin/cirurgias'
  draw 'admin/especies'
  draw 'admin/exames'
  draw 'admin/pelagens'
  draw 'admin/racas'
  draw 'admin/servicos'
  draw 'admin/usuarios'
  draw 'admin/vacinas'
  draw 'admin/vermifugos'
end