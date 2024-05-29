class Admin::CirurgiasController < AdminController
  before_action :set_current_usuario
  before_action :set_cirurgia_repository
  before_action :set_cirurgia, only: [:edit, :update, :destroy]

  def index
    @cirurgias = @cirurgia_repository.paginate(params)
    @pagy, @cirurgias = pagy(@cirurgias)
  end

  def show; end

  def new
    @cirurgia = Cirurgia.new
  end

  def edit; end

  def create
    @cirurgia = Cirurgia.new(cirurgia_params)

    if @cirurgia.valid?
      result = @cirurgia_repository.create(cirurgia_params)

      if result == true
        flash[:success] = 'Cirurgia cadastrada com sucesso'
        redirect_to admin_cirurgias_path
      else
        flash[:error] = result
        redirect_to new_admin_cirurgia_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @cirurgia_repository.update(@cirurgia, cirurgia_params)

    if result == true
      flash[:success] = 'Cirurgia atualizada com sucesso'
      redirect_to admin_cirurgias_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @cirurgia_repository.destroy(@cirurgia)
    
    if result == true
      flash[:success] = 'Cirurgia deletada com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_cirurgias_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_cirurgia_repository
    @cirurgia_repository = CirurgiaRepository.new
  end

  def cirurgia_params
    params.require(:cirurgia).permit(:nome, :descricao)
  end

  def set_cirurgia
    @cirurgia = Cirurgia.find(params[:id])
  end
end
