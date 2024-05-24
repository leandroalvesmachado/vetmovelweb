class Admin::CirurgiasController < AdminController
  before_action :set_current_usuario

  def index
    @cirurgias = Cirurgia.all
    @pagy, @cirurgias = pagy(@cirurgias)
  end

  def show
  end

  def new
    @cirurgia = Cirurgia.new
  end

  def edit
  end

  def create
    @cirurgia = Cirurgia.new(cirurgia_params)
    
    if @cirurgia.save
      flash[:message] = 'Salvo'
      flash[:type] = :success
      redirect_to admin_cirurgias_path, notice: 'Produto criado com sucesso.'
    else
      flash[:message] = 'Erro'
      flash[:type] = :error
      render :new, status: :unprocessable_entity
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
