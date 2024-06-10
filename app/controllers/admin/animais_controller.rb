class Admin::AnimaisController < AdminController
  before_action :set_animal, only: [:show]
  before_action :set_current_usuario
  before_action :set_repositories, only: [:index]
  before_action :set_dependencies, only: [:index]

  def index
    @animais = @animal_repository.paginate(params)
    @pagy, @animais = pagy(@animais)
    @animais = @animais.map(&:decorate)
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update
    result = @cidadao_repository.update(@cidadao, cidadao_params)

    if result == true
      flash[:success] = 'Cidadão atualizado com sucesso'
      redirect_to admin_cidadaos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @cidadao_repository.destroy(@cidadao)
    
    if result == true
      flash[:success] = 'Cidadão deletado com sucesso'
    else
      flash[:error] = result
    end

    redirect_to admin_cidadaos_path
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_animal
    @animal = Animal.find(params[:id]).decorate
  end

  def set_repositories
    @animal_repository = AnimalRepository.new
    @animal_sexo_repository = AnimalSexoRepository.new
  end

  def set_dependencies
    @castrados = @animal_repository.select_option_castrado()
    @obitos = @animal_repository.select_option_obito()
    @animais_sexos = @animal_sexo_repository.select_option()
  end
end
