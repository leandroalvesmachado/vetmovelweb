class Admin::AnimaisController < ApplicationController
  before_action :set_current_usuario
  before_action :set_repositories
  before_action :set_cidadao
  before_action :set_dependencies, only: [:new, :edit, :create]
  before_action :set_animal, only: [:new_image]

  def new
    @animal = Animal.new
  end

  def new_image
  end

  def edit; end

  def create
    puts animal_params
    @animal = Animal.new(animal_params)

    if @animal.valid?
      result = @animal_repository.create(@cidadao, animal_params)

      if result == true
        flash[:success] = 'Animal cadastrado com sucesso'
        redirect_to admin_cidadao_path(@cidadao)
      else
        flash[:error] = 'Erro ao cadastrar o animal: ' + result
        redirect_to admin_cidadao_path(@cidadao)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_cidadao
    @cidadao = Cidadao.find(params[:cidadao_id]).decorate
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
