class PerfilRepository
  def initialize()
    @model = Perfil
  end

  def select_option()
    begin
      perfis = @model.order(:nome).pluck(:nome, :id)
      perfis.unshift(['Escolha a opção', nil])
      options = perfis.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
