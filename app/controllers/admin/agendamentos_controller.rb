class Admin::AgendamentosController < AdminController
  before_action :set_repositories, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_dependencies, only: [:index, :new, :edit, :create, :update]

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
      result = @agendamento_repository.create(usuario_params)

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
  end

  def set_dependencies
    @cidadaos = @cidadao_repository.select_option()
    @servicos = @servico_repository.select_option()
  end

  def agendamento_params
    params.require(:agendamento).permit(
      :cidadao_id, 
      :animal_id,
      :servico_id
    )
  end
end