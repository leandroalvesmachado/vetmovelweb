class RacaRepository
  def initialize()
    @model = Raca
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

  def update(raca, attributes)
    begin
      raca.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(raca)
    begin
      raca.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end
end
