class Admin::AjaxController < AdminController
  before_action :set_repositories

  def racas_by_especie
    especie_id = params[:especie_id]
    racas = @raca_repository.find_by_especie(especie_id)
    
    render json: racas
  end

  def animais_by_cidadao
    cidadao_id = params[:cidadao_id]
    animais = @animal_repository.find_by_cidadao(cidadao_id)
    
    render json: animais
  end

  private

  def set_repositories
    @raca_repository = RacaRepository.new
    @animal_repository = AnimalRepository.new
  end
end
