class UsuarioRepository
  def initialize()
    @model = Usuario
  end

  def paginate(params)
    begin
      query = @model

      if params[:nome].present?
        query = query.where("nome LIKE ?", "%#{params[:nome]}%")
      end

      return query
    rescue => e
      return @model.none
    end
  end

  def create(attributes)
    begin
      ActiveRecord::Base.transaction do
        usuario = Usuario.new(attributes)
        usuario.password = Devise.friendly_token.first(12)
        usuario.save!
      end
      
      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def update(usuario, attributes)
    begin
      usuario.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(usuario)
    begin
      ActiveRecord::Base.transaction do
        # if cidadao.animais.any?
        #   cidadao.animais.each do |animal|
        #     animal.imagem.purge if animal.imagem.attached?

        #     if animal.imagens.attached?
        #       animal.imagens.each do |imagem|
        #         imagem.purge
        #       end
        #     end

        #     animal.destroy!
        #   end
        # end
        
        usuario.destroy!
      end
      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end
end
