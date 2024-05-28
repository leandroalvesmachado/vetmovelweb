class Admin::ExamesController < AdminController
  before_action :set_current_usuario
  before_action :set_exame, only: [:edit, :update, :destroy]

  def index
    @exames = Exame.all
    @pagy, @exames = pagy(@exames)
  end

  def show; end

  def new
    @exame = Exame.new
  end

  def edit; end

  def create
    @exame = Exame.new(exame_params)
    
    if @exame.save
      flash[:success] = 'Exame cadastrado com sucesso'
      redirect_to admin_exames_path
    elsif @exame.errors.any?
      render :new, status: :unprocessable_entity
    else
      flash[:error] = 'Erro ao cadastrar o exame'
      redirect_to new_admin_exame_path
    end
  end

  def update
    if @exame.update(exame_params)
      flash[:success] = 'Exame atualizado com sucesso'
      redirect_to admin_exames_path
    elsif @exame.errors.any?
      render :edit, status: :unprocessable_entity
    else
      flash[:error] = 'Erro ao atualizar o exame'
      redirect_to edit_admin_exame_path(@exame)
    end
  end

  def destroy
    if @exame.destroy
      flash[:success] = 'Exame deletado com sucesso'
    else
      flash[:error] = 'Erro ao deletar o exame'
    end

    redirect_to admin_exames_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def exame_params
    params.require(:exame).permit(:nome, :descricao)
  end

  def set_exame
    @exame = Exame.find(params[:id])
  end
end
