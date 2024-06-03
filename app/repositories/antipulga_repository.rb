class AntipulgaRepository
  def initialize()
    @model = Antipulga
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

  def update(antipulga, attributes)
    begin
      antipulga.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(antipulga)
    begin
      antipulga.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end
end
