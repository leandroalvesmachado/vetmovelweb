# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

begin
  ActiveRecord::Base.transaction do
    usuario = Usuario.find_or_create_by!(email: 'leandro.machado@cgm.fortaleza.ce.gov.br') do |usuario|
      usuario.nome = 'Leandro Alves Machado'
      usuario.password = 'P@ssword'
      usuario.password_confirmation = 'P@ssword'
    end

    if usuario.present?
      generos = [
        { nome: 'Masculino', descricao: 'Masculino'},
        { nome: 'Feminino', descricao: 'Feminino'}
      ]

      generos.each do |genero|
        Genero.create!(
          nome: genero[:nome],
          descricao: genero[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      animais_sexos = [
        { nome: 'Macho', descricao: 'Macho'},
        { nome: 'Fêmea', descricao: 'Fêmea'},
        { nome: 'Indeterminado', descricao: 'Indeterminado'}
      ]

      animais_sexos.each do |animal_sexo|
        AnimalSexo.create!(
          nome: animal_sexo[:nome],
          descricao: animal_sexo[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      perfis = [
        { codigo: 1, nome: 'Administrador', descricao: 'Perfil de acesso ao sistema como Administrador' },
        { codigo: 2, nome: 'Central', descricao: 'Perfil de acesso ao sistema como Central' },
        { codigo: 3, nome: 'Cidadão', descricao: 'Perfil de acesso ao sistema como Cidadão' },
      ]

      perfis.each do |perfil|
        Perfil.create!(
          codigo: perfil[:codigo],
          nome: perfil[:nome],
          descricao: perfil[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      perfil_adm = Perfil.find_by!(codigo: 1)

      UsuarioPerfil.create!(
        usuario_id: usuario.id,
        perfil_id: perfil_adm.id,
        created_by: usuario.id,
        updated_by: usuario.id
      )

      pais = Pais.find_or_create_by!(nome: 'Brasil') do |pais|
        pais.nome = 'Brasil'
        pais.created_by = usuario.id
        pais.updated_by = usuario.id
      end

      estados = [
        { nome: 'Acre', sigla: 'AC' },
        { nome: 'Alagoas', sigla: 'AL' },
        { nome: 'Amapá', sigla: 'AP' },
        { nome: 'Amazonas', sigla: 'AM' },
        { nome: 'Bahia', sigla: 'BH' },
        { nome: 'Ceará', sigla: 'CE' },
        { nome: 'Distrito Federal', sigla: 'DF' },
        { nome: 'Espírito Santo', sigla: 'ES' },
        { nome: 'Goiás', sigla: 'GO' },
        { nome: 'Maranhão', sigla: 'MA' },
        { nome: 'Mato Grosso', sigla: 'MT' },
        { nome: 'Mato Grosso do Sul', sigla: 'MS' },
        { nome: 'Minas Gerais', sigla: 'MG' },
        { nome: 'Pará', sigla: 'PA' },
        { nome: 'Paraíba', sigla: 'PB' },
        { nome: 'Paraná', sigla: 'PR' },
        { nome: 'Pernambuco', sigla: 'PE' },
        { nome: 'Piauí', sigla: 'PI' },
        { nome: 'Rio de Janeiro', sigla: 'RJ' },
        { nome: 'Rio Grande do Norte', sigla: 'RN' },
        { nome: 'Rio Grande do Sul', sigla: 'RS' },
        { nome: 'Rondônia', sigla: 'RO' },
        { nome: 'Roraima', sigla: 'RR' },
        { nome: 'Santa Catarina', sigla: 'SC' },
        { nome: 'São Paulo', sigla: 'SP' },
        { nome: 'Sergipe', sigla: 'SE' },
        { nome: 'Tocantins', sigla: 'TO' },
      ]

      estados.each do |estado|
        Estado.create!(
          pais_id: pais.id,
          nome: estado[:nome],
          sigla: estado[:sigla],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      estado_ceara = Estado.find_by!(sigla: 'CE')

      municipios = [
        { nome: 'Fortaleza', codigo_ibge: '2304400'}
      ]

      municipios.each do |municipio|
        Municipio.create!(
          estado_id: estado_ceara.id,
          nome: municipio[:nome],
          codigo_ibge: municipio[:codigo_ibge],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      municipio_fortaleza = Municipio.find_by!(codigo_ibge: '2304400')
      regionais_fortaleza = [
        { nome: 'Regional I', sigla: 'SER I'},
        { nome: 'Regional II', sigla: 'SER II'},
        { nome: 'Regional III', sigla: 'SER III'},
        { nome: 'Regional IV', sigla: 'SER IV'},
        { nome: 'Regional V', sigla: 'SER V'},
        { nome: 'Regional VI', sigla: 'SER VI'},
        { nome: 'Regional VII', sigla: 'SER VII'},
        { nome: 'Regional VIII', sigla: 'SER VIII'},
        { nome: 'Regional VIII', sigla: 'SER VIII'},
        { nome: 'Regional IX', sigla: 'SER IX'},
        { nome: 'Regional X', sigla: 'SER X'},
        { nome: 'Regional XI', sigla: 'SER XI'},
        { nome: 'Regional XII', sigla: 'SER XII'},
      ]

      regionais_fortaleza.each do |regional_fortaleza|
        Regional.create!(
          municipio_id: municipio_fortaleza.id,
          nome: regional_fortaleza[:nome],
          sigla: regional_fortaleza[:sigla],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      pelagens = [
        { nome: 'Amarelo', descricao: 'Animal com cor do pelo amarelo' },
        { nome: 'Azul', descricao: 'Animal com cor do pelo azul' },
        { nome: 'Branco', descricao: 'Animal com cor do pelo branco' },
        { nome: 'Preto', descricao: 'Animal com cor do pelo preto' }
      ]

      pelagens.each do |pelagem|
        Pelagem.create!(
          nome: pelagem[:nome],
          descricao: pelagem[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      especies = [
        { nome: 'Aves', descricao: 'Aves' },
        { nome: 'Canina', descricao: 'Canina' },
        { nome: 'Felina', descricao: 'Felina' },
      ]

      especies.each do |especie|
        Especie.create!(
          nome: especie[:nome],
          descricao: especie[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      vacinas = [
        { nome: 'Vacina Giárdia	', descricao: 'Vacina Giárdia' },
        { nome: 'Vacina Gripe	', descricao: 'Vacina Gripe' },
        { nome: 'Vacina Leish-tec	', descricao: 'Vacina Leish-tec' },
        { nome: 'Vacina Raiva', descricao: 'Vacina Raiva' },
        { nome: 'Vacina V10 Inomune', descricao: 'Vacina V10 Inomune' },
        { nome: 'Vacina V10 Vanguard Plus', descricao: 'Vacina V10 Vanguard Plus' },
        { nome: 'Vacina V5', descricao: 'Vacina V5' },
      ]

      vacinas.each do |vacina|
        Vacina.create!(
          nome: vacina[:nome],
          descricao: vacina[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end
    else
      puts 'Usuário não encontrado com o email especificado'
    end
  end
rescue => e
  puts "Erro ao executar seeds: #{e.message}"
end