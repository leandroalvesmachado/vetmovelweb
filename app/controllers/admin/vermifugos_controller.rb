class Admin::VermifugosController < AdminController
  before_action :set_current_usuario
  before_action :set_vermifugo_repository
  before_action :set_vermifugo, only: [:edit, :update, :destroy]

  def index
    @vermifugos = @vermifugo_repository.paginate(params)
    @pagy, @vermifugos = pagy(@vermifugos)
  end

  def show; end

  def new
    @vermifugo = Vermifugo.new
  end

  def edit; end

  def create
    @vermifugo = Vermifugo.new(vermifugo_params)

    if @vermifugo.valid?
      result = @vermifugo_repository.create(vermifugo_params)

      if result == true
        flash[:success] = 'Vermífugo cadastrado com sucesso'
        redirect_to admin_vermifugos_path
      else
        flash[:error] = result
        redirect_to new_admin_vermifugo_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @vermifugo_repository.update(@vermifugo, vermifugo_params)

    if result == true
      flash[:success] = 'Vermífugo atualizado com sucesso'
      redirect_to admin_vermifugos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @vermifugo_repository.destroy(@vermifugo)
    
    if result == true
      flash[:success] = 'Vermífugo deletado com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_vermifugos_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_vermifugo_repository
    @vermifugo_repository = VermifugoRepository.new
  end

  def vermifugo_params
    params.require(:vermifugo).permit(:nome, :descricao)
  end

  def set_vermifugo
    @vermifugo = Vermifugo.find(params[:id])
  end
end
