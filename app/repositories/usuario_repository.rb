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

      if params[:perfil_id].present?
        query = query.joins('INNER JOIN usuarios_perfis ON usuarios_perfis.usuario_id = usuarios.id')
          .joins('INNER JOIN perfis ON perfis.id = usuarios_perfis.perfil_id')
          .where('usuarios_perfis.perfil_id = ?', params[:perfil_id])
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
      ActiveRecord::Base.transaction do
        usuario.usuario_perfis.delete_all
        usuario.update!(attributes)
      end

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(usuario)
    begin
      ActiveRecord::Base.transaction do
        usuario.destroy!
      end
      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end
end
