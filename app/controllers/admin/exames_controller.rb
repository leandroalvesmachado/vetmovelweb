class Admin::ExamesController < AdminController
  before_action :set_current_usuario
  before_action :set_exame_repository
  before_action :set_exame, only: [:edit, :update, :destroy]

  def index
    @exames = @exame_repository.paginate(params)
    @pagy, @exames = pagy(@exames)
  end

  def show; end

  def new
    @exame = Exame.new
  end

  def edit; end

  def create
    @exame = Exame.new(exame_params)

    if @exame.valid?
      result = @exame_repository.create(exame_params)

      if result == true
        flash[:success] = 'Exame cadastrado com sucesso'
        redirect_to admin_exames_path
      else
        flash[:error] = result
        redirect_to new_admin_exame_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    result = @exame_repository.update(@exame, exame_params)

    if result == true
      flash[:success] = 'Exame atualizado com sucesso'
      redirect_to admin_exames_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @exame_repository.destroy(@exame)
    
    if result == true
      flash[:success] = 'Exame deletado com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_exames_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_exame_repository
    @exame_repository = ExameRepository.new
  end

  def exame_params
    params.require(:exame).permit(:nome, :descricao)
  end

  def set_exame
    @exame = Exame.find(params[:id])
  end
end
