class Admin::HomeController < AdminController
  before_action :set_repositories, only: [:index]

  def index
    @cidadaos = @cidadao_repository.all.count
    @animais = @animal_repository.all.count
    @agendamentos = @agendamento_repository.all.count
  end

  private

  def set_repositories
    @cidadao_repository = CidadaoRepository.new
    @animal_repository = AnimalRepository.new
    @agendamento_repository = AnimalRepository.new
  end
end
