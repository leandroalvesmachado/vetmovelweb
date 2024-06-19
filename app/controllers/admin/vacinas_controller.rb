class Admin::VacinasController < AdminController
  before_action :set_authorize
  before_action :set_repositories
  before_action :set_vacina, only: [:edit, :update, :destroy]

  def index 
    @vacinas = @vacina_repository.paginate(params)
    @pagy, @vacinas = pagy(@vacinas)
  end

  def show; end

  def new
    @vacina = Vacina.new
  end

  def edit; end

  def create
    @vacina = Vacina.new(vacina_params)

    if @vacina.valid?
      result = @vacina_repository.create(vacina_params)

      if result == true
        flash[:success] = 'Vacina cadastrada com sucesso'
        redirect_to admin_vacinas_path
      else
        flash[:error] = result
        redirect_to new_admin_vacina_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @vacina_repository.update(@vacina, vacina_params)

    if result == true
      flash[:success] = 'Vacina atualizada com sucesso'
      redirect_to admin_vacinas_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @vacina_repository.destroy(@vacina)
    
    if result == true
      flash[:success] = 'Vacina deletada com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_vacinas_path
  end

  private

  def set_authorize
    authorize @vacina || Vacina
  end

  def set_repositories
    @vacina_repository = VacinaRepository.new
  end

  def vacina_params
    params.require(:vacina).permit(:nome, :descricao)
  end

  def set_vacina
    @vacina = Vacina.find(params[:id])
  end
end
