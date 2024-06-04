class Admin::PelagensController < AdminController
  before_action :set_current_usuario
  before_action :set_pelagem_repository
  before_action :set_pelagem, only: [:edit, :update, :destroy]

  def index
    @pelagens = @pelagem_repository.paginate(params)
    @pagy, @pelagens = pagy(@pelagens)
  end

  def show; end

  def new
    @pelagem = Pelagem.new
  end

  def edit; end

  def create
    @pelagem = Pelagem.new(pelagem_params)

    if @pelagem.valid?
      result = @pelagem_repository.create(pelagem_params)

      if result == true
        flash[:success] = 'Pelagem cadastrada com sucesso'
        redirect_to admin_pelagens_path
      else
        flash[:error] = result
        redirect_to new_admin_pelagem_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @pelagem_repository.update(@pelagem, pelagem_params)

    if result == true
      flash[:success] = 'Pelagem atualizada com sucesso'
      redirect_to admin_pelagens_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @pelagem_repository.destroy(@pelagem)
    
    if result == true
      flash[:success] = 'Pelagem deletada com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_pelagens_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_pelagem_repository
    @pelagem_repository = PelagemRepository.new
  end

  def pelagem_params
    params.require(:pelagem).permit(:nome, :descricao)
  end

  def set_pelagem
    @pelagem = Pelagem.find(params[:id])
  end
end
