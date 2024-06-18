class AgendamentoStatusRepository
  def initialize()
    @model = AgendamentoStatus
  end

  def select_option()
    begin
      agendamentos_status = @model.order(:nome).pluck(:nome, :id)
      agendamentos_status.unshift(['Escolha a opção', nil])
      options = agendamentos_status.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
