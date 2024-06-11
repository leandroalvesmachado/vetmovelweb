class Admin::ServicosController < AdminController
  before_action :set_servico, only: [:show, :edit, :update, :destroy]
  before_action :set_repositories, only: [:index, :create, :update, :destroy]

  def index
    @servicos = @servico_repository.paginate(params)
    @pagy, @servicos = pagy(@servicos)
    @servicos = @servicos.map(&:decorate)
  end

  def show; end

  def new
    @servico = Servico.new
  end

  def edit; end

  def create
    @servico = Servico.new(servico_params)

    if @servico.valid?
      result = @servico_repository.create(servico_params)

      if result == true
        flash[:success] = 'Serviço cadastrado com sucesso'
        redirect_to admin_servicos_path
      else
        flash[:error] = 'Erro ao cadastrar o serviço: ' + result
        redirect_to new_admin_servico_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @servico.assign_attributes(servico_params)
    
    if @servico.valid?
      result = @servico_repository.update(@servico, servico_params)

      if result == true
        flash[:success] = 'Serviço atualizado com sucesso'
      else
        flash[:error] = 'Erro ao atualizar o serviço: ' + result
      end

      redirect_to edit_admin_servico_path(@servico)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @servico_repository.destroy(@servico)
    
    if result == true
      flash[:success] = 'Serviço deletado com sucesso'
    else
      flash[:error] = 'Erro ao deletar o serviço: ' + result
    end

    redirect_to admin_servicos_path
  end

  private

  def set_servico
    @servico = Servico.find_by(id: params[:id])

    if @servico.nil?
      flash[:error] = 'Serviço não encontrado'
      redirect_to admin_servicos_path
    else
      @servico = @servico.decorate
    end
  end

  def set_repositories
    @servico_repository = ServicoRepository.new
  end

  def servico_params
    params.require(:servico).permit(:nome, :descricao)
  end
end
