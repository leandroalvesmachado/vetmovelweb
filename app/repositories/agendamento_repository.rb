class AgendamentoRepository
  def initialize()
    @model = Agendamento
  end

  def paginate(params)
    begin
      query = @model

      if params[:data_inicio].present? && params[:data_fim].present?
        query = query.where(data: params[:data_inicio]..params[:data_fim])
      elsif params[:data_inicio].present?
        query = query.where("data >= ?", params[:data_inicio])
      elsif params[:data_fim].present?
        query = query.where("data <= ?", params[:data_fim])
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

  def update(agendamento, attributes)
    begin
      agendamento.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(agendamento)
    begin
      agendamento.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end
end
