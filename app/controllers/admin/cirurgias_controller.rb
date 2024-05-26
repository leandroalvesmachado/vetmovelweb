class Admin::CirurgiasController < AdminController
  before_action :set_current_usuario

  def index
    @cirurgias = Cirurgia.all
    @pagy, @cirurgias = pagy(@cirurgias)
  end

  def show; end

  def new
    @cirurgia = Cirurgia.new
  end

  def edit; end

  def create
    @cirurgia = Cirurgia.new(cirurgia_params)

    if @cirurgia.save
      flash[:success] = 'Cirurgia cadastrada com sucesso'
      redirect_to admin_cirurgias_path
    elsif @cirurgia.errors.any?
      render :new, status: :unprocessable_entity
    else
      flash[:error] = 'Erro ao cadastrar a cirurgia'
      redirect_to new_admin_cirurgia_path
    end
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def cirurgia_params
    params.require(:cirurgia).permit(:nome, :descricao)
  end
end
