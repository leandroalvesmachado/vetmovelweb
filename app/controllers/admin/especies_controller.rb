class Admin::EspeciesController < AdminController
  before_action :set_current_usuario
  before_action :set_especie_repository
  before_action :set_especie, only: [:edit, :update, :destroy]

  def index
    @especies = @especie_repository.paginate(params)
    @pagy, @especies = pagy(@especies)
  end

  def show; end

  def new
    @especie = Especie.new
  end

  def edit; end

  def create
    @especie = Especie.new(especie_params)

    if @especie.valid?
      result = @especie_repository.create(especie_params)

      if result == true
        flash[:success] = 'Espécie cadastrada com sucesso'
        redirect_to admin_especies_path
      else
        flash[:error] = result
        redirect_to new_admin_especie_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @especie_repository.update(@especie, especie_params)

    if result == true
      flash[:success] = 'Espécie atualizada com sucesso'
      redirect_to admin_especies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @especie_repository.destroy(@especie)
    
    if result == true
      flash[:success] = 'Espécie deletada com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_especies_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_especie_repository
    @especie_repository = EspecieRepository.new
  end

  def especie_params
    params.require(:especie).permit(:nome, :descricao)
  end

  def set_especie
    @especie = Especie.find(params[:id])
  end
end
