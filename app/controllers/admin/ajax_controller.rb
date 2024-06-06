class Admin::AjaxController < AdminController
  before_action :set_repositories

  def racas_by_especie
    especie_id = params[:especie_id]
    racas = @raca_repository.find_by_especie(especie_id)
    
    render json: racas
  end

  private

  def set_repositories
    @raca_repository = RacaRepository.new
  end
end
