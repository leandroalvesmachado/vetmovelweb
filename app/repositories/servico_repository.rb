class ServicoRepository
  def initialize()
    @model = Servico
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
      @model.create!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def update(servico, attributes)
    begin
      servico.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(servico)
    begin
      servico.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def select_option()
    begin
      servicos = @model.order(:nome).pluck(:nome, :id)
      servicos.unshift(['Escolha a opção', nil])
      options = servicos.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
