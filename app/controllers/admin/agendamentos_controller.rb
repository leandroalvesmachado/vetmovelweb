class Admin::AgendamentosController < AdminController
  before_action :set_repositories, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_dependencies, only: [:index, :new, :edit, :create, :update]
  before_action :set_agendamento, only: [:edit, :update, :destroy]

  def index
    @agendamentos = @agendamento_repository.paginate(params)
    @pagy, @agendamentos = pagy(@agendamentos)
    @agendamentos = @agendamentos.map(&:decorate)
  end

  def show; end

  def new
    @agendamento = Agendamento.new
  end

  def edit; end

  def create
    @agendamento = Agendamento.new(agendamento_params)
    
    if @agendamento.valid?
      result = @agendamento_repository.create(agendamento_params)

      if result == true
        flash[:success] = 'Agendamento cadastrado com sucesso'
        redirect_to admin_agendamentos_path
      else
        flash[:error] = 'Erro ao cadastrar o agendamento: ' + result
        redirect_to new_admin_agendamento_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def set_repositories
    @agendamento_repository = AgendamentoRepository.new
    @cidadao_repository = CidadaoRepository.new
    @servico_repository = ServicoRepository.new
    @agenda_repository = AgendaRepository.new
    @usuario_repository = UsuarioRepository.new
    @agendamento_status_repository = AgendamentoStatusRepository.new
  end

  def set_dependencies
    @cidadaos = @cidadao_repository.select_option()
    @servicos = @servico_repository.select_option()
    @agendas = @agenda_repository.select_option()
    @funcionarios = @usuario_repository.select_option_funcionario()
    @status = @agendamento_status_repository.select_option()
  end

  def agendamento_params
    params.require(:agendamento).permit(
      :agenda_id,
      :cidadao_id, 
      :animal_id,
      :servico_id,
      :data,
      :hora_inicio,
      :hora_fim,
      :funcionario_id,
      :observacao
    )
  end

  def set_agendamento
    @agendamento = Agendamento.find(params[:id]).decorate
  end
end