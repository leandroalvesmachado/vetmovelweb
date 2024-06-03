class Admin::RacasController < AdminController
  before_action :set_current_usuario
  before_action :set_raca_repository
  before_action :set_especie_repository
  before_action :set_raca, only: [:edit, :update, :destroy]
  before_action :set_especies, only: [:index, :new, :edit, :create, :update]
  
  def index
    @racas = @raca_repository.paginate(params)
    @pagy, @racas = pagy(@racas)
  end

  def show; end

  def new
    @raca = Raca.new
  end

  def edit; end

  def create
    @raca = Raca.new(raca_params)

    if @raca.valid?
      result = @raca_repository.create(raca_params)

      if result == true
        flash[:success] = 'Raça cadastrada com sucesso'
        redirect_to admin_racas_path
      else
        flash[:error] = result
        redirect_to new_admin_raca_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @raca_repository.update(@raca, raca_params)

    if result == true
      flash[:success] = 'Raça atualizada com sucesso'
      redirect_to admin_racas_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @raca_repository.destroy(@raca)
    
    if result == true
      flash[:success] = 'Raça deletado com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_racas_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_raca_repository
    @raca_repository = RacaRepository.new
  end

  def raca_params
    params.require(:raca).permit(:especie_id, :nome, :descricao)
  end

  def set_raca
    @raca = Raca.find(params[:id])
  end

  def set_especie_repository
    @especie_repository = EspecieRepository.new
  end

  def set_especies
    @especies = @especie_repository.select_option()
  end
end
