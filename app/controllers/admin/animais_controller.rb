class Admin::AnimaisController < ApplicationController
  before_action :set_current_usuario
  before_action :set_animal_repository
  before_action :set_cidadao

  def new
    @animal = Animal.new
  end

  def edit; end

  def create
    @animal = Animal.new(animal_params)

    if @animal.valid?
      result = @animal_repository.create(animal_params)

      if result == true
        flash[:success] = 'Animal cadastrado com sucesso'
        redirect_to admin_cidadao_path(@cidadao)
      else
        flash[:error] = result
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

  def set_animal_repository
    @animal_repository = AnimalRepository.new
  end

  def set_cidadao
    @cidadao = Cidadao.find(params[:cidadao_id]).decorate
  end

  def animal_params
    params.require(:animal).permit(
      :nome,
      :animal_sexo_id
    )
  end
end
