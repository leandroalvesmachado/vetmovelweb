class Admin::AnimaisController < AdminController
  before_action :set_current_usuario
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_repositories, only: [:index, :edit, :update, :destroy]
  before_action :set_dependencies, only: [:index, :edit, :update]

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
    @animal.assign_attributes(animal_params)
    
    if @animal.valid?
      result = @animal_repository.update(@animal.cidadao, @animal, animal_params)

      if result == true
        flash[:success] = 'Animal atualizado com sucesso'
      else
        flash[:error] = 'Erro ao atualizar o animal: ' + result
      end

      redirect_to edit_admin_animal_path(@animal)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @animal_repository.destroy(@animal)
    
    if result == true
      flash[:success] = 'Animal deletado com sucesso'
    else
      flash[:error] = 'Erro ao deletar o animal: ' + result
    end

    redirect_to admin_animais_path
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
    @pelagem_repository = PelagemRepository.new
    @especie_repository = EspecieRepository.new
  end

  def set_dependencies
    @castrados = @animal_repository.select_option_castrado()
    @obitos = @animal_repository.select_option_obito()
    @animais_sexos = @animal_sexo_repository.select_option()
    @pelagens = @pelagem_repository.select_option()
    @especies = @especie_repository.select_option()
  end

  def animal_params
    params.require(:animal).permit(
      :nome,
      :data_nascimento,
      :castrado,
      :animal_sexo_id,
      :pelagem_id,
      :especie_id,
      :raca_id,
      :obito
    )
  end
end
