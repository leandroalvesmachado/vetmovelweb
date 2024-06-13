class CidadaoRepository
  def initialize()
    @model = Cidadao
  end

  def all
    return @model.all
  end

  def paginate(params)
    begin
      query = @model

      if params[:nome].present?
        query = query.where("nome LIKE ?", "%#{params[:nome]}%")
      end

      if params[:descricao].present?
        query = query.where("descricao LIKE ?", "%#{params[:descricao]}%")
      end

      return query
    rescue => e
      return @model.none
    end
  end

  def create(attributes)
    begin
      ActiveRecord::Base.transaction do
        nome, email = attributes.values_at(:nome, :email)

        usuario = Usuario.new(nome: nome, email: email, password: Devise.friendly_token.first(12))
        usuario.save!

        cidadao = Cidadao.new(attributes.merge(usuario_id: usuario.id))
        cidadao.save!

        usuario_perfil = UsuarioPerfil.new(usuario_id: usuario.id, perfil_id: Perfil.cidadao)
        usuario_perfil.save!
      end
      
      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def update(cidadao, attributes)
    begin
      ActiveRecord::Base.transaction do
        cidadao.update!(attributes)
      end

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(cidadao)
    begin
      ActiveRecord::Base.transaction do
        if cidadao.animais.present? && cidadao.animais.any?
          cidadao.animais.each do |animal|
            animal.imagem.purge if animal.imagem.attached?

            if animal.imagens.attached?
              animal.imagens.each do |imagem|
                imagem.purge
              end
            end

            animal.destroy!
          end
        end
        
        cidadao.destroy!
        cidadao.usuario.destroy!
      end
      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def select_option()
    begin
      cidadaos = @model.order(:nome).pluck(
        Arel.sql("CONCAT(cpf, ' - ', nome, ' - ', email) AS nome"), :id
      )
      cidadaos.unshift(['Escolha a opção', nil])
      options = cidadaos.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
