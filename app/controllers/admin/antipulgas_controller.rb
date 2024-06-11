class Admin::AntipulgasController < AdminController
  before_action :set_current_usuario
  before_action :set_antipulga_repository
  before_action :set_antipulga, only: [:edit, :update, :destroy]

  def index
    @antipulgas = @antipulga_repository.paginate(params)
    @pagy, @antipulgas = pagy(@antipulgas)
  end

  def show; end

  def new
    @antipulga = Antipulga.new
  end

  def edit; end

  def create
    @antipulga = Antipulga.new(antipulga_params)

    if @antipulga.valid?
      result = @antipulga_repository.create(antipulga_params)

      if result == true
        flash[:success] = 'Antipulga cadastrado com sucesso'
        redirect_to admin_antipulgas_path
      else
        flash[:error] = result
        redirect_to new_admin_antipulga_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @antipulga.valid?
      result = @antipulga_repository.update(@antipulga, antipulga_params)

      if result == true
        flash[:success] = 'Antipulga atualizado com sucesso'
      else
        flash[:error] = 'Erro ao atualizar o antipulga: ' + result
      end

      redirect_to admin_antipulgas_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @antipulga_repository.destroy(@antipulga)
    
    if result == true
      flash[:success] = 'Antipulga deletado com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_antipulgas_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_antipulga_repository
    @antipulga_repository = AntipulgaRepository.new
  end

  def antipulga_params
    params.require(:antipulga).permit(:nome, :descricao)
  end

  def set_antipulga
    @antipulga = Antipulga.find(params[:id])
  end
end
