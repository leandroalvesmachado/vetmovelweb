# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
Usuario.create!(
  nome: 'Leandro Alves Machado',
  email: 'leandro.machado@cgm.fortaleza.ce.gov.br',
  password: 'P@ssword',
  password_confirmation: 'P@ssword'
)

# Buscar usuario pelo email
usuario = Usuario.find_by(email: 'leandro.machado@cgm.fortaleza.ce.gov.br')

# Verificar se o usuario existe
if usuario.present?
  cirurgias = [
    { nome: 'Vacina Giárdia', descricao: 'É indicada como auxiliar na prevenção da giardíase canina.' },
    { nome: 'Vacina Gripe', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Raiva', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Giárdia', descricao: 'É indicada como auxiliar na prevenção da giardíase canina.' },
    { nome: 'Vacina Gripe', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Raiva', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Giárdia', descricao: 'É indicada como auxiliar na prevenção da giardíase canina.' },
    { nome: 'Vacina Gripe', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Raiva', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Giárdia', descricao: 'É indicada como auxiliar na prevenção da giardíase canina.' },
    { nome: 'Vacina Gripe', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Raiva', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Giárdia', descricao: 'É indicada como auxiliar na prevenção da giardíase canina.' },
    { nome: 'Vacina Gripe', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
    { nome: 'Vacina Raiva', descricao: 'A vacinação contra a raiva abrange a prevenção da raiva antes da exposição.' },
  ]

  cirurgias.each do |cirurgia|
    Cirurgia.create!(
      nome: cirurgia[:nome],
      descricao: cirurgia[:descricao],
      created_by: usuario.id,
      updated_by: usuario.id
    )
  end
else
  puts "Usuário não encontrado com o email especificado"
end
