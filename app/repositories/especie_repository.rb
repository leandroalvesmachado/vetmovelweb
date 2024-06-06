class EspecieRepository
  def initialize()
    @model = Especie
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

  def update(especie, attributes)
    begin
      especie.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(especie)
    begin
      especie.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def select_option()
    begin
      especies = @model.order(:nome).pluck(:nome, :id)
      especies.unshift(['Escolha a opção', nil])
      options = especies.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
