class Admin::CidadaosController < AdminController
  before_action :set_current_usuario
  before_action :set_cidadao_repository
  before_action :set_cidadao, only: [:show, :edit, :update, :destroy]

  def index
    @cidadaos = @cidadao_repository.paginate(params)
    @pagy, @cidadaos = pagy(@cidadaos)
  end

  def show; end

  def new
    @cidadao = Cidadao.new
  end

  def edit; end

  def create
    @cidadao = Cidadao.new(cidadao_params)

    if @cidadao.valid?
      result = @cidadao_repository.create(cidadao_params)

      if result == true
        flash[:success] = 'Cidadão cadastrado com sucesso'
        redirect_to admin_cidadaos_path
      else
        flash[:error] = result
        redirect_to new_admin_cidadao_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @cidadao_repository.update(@cidadao, cidadao_params)

    if result == true
      flash[:success] = 'Cidadão atualizado com sucesso'
      redirect_to admin_cidadaos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @cidadao_repository.destroy(@cidadao)
    
    if result == true
      flash[:success] = 'Cidadão deletado com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_cidadaos_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_cidadao_repository
    @cidadao_repository = CidadaoRepository.new
  end

  def cidadao_params
    params.require(:cidadao).permit(
      :cpf, 
      :nome,
      :nome_social,
      :data_nascimento,
      :email,
      :telefone,
      :celular,
      :telefone_contato
    )
  end

  def set_cidadao
    @cidadao = Cidadao.find(params[:id]).decorate
  end
end
