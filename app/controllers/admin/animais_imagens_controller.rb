class Admin::AnimaisImagensController < AdminController
  before_action :set_current_usuario, :set_animal
  before_action :set_repositories

  def new; end

  def create
    if @animal.valid?(:animais_imagens)
      if !params[:animal][:imagem].nil? || (params[:animal][:imagens].present? && params[:animal][:imagens].reject(&:blank?).any?)
        result = @animal_repository.create_image(@animal, params[:animal][:imagem], params[:animal][:imagens])

        if result == true
          flash[:success] = 'Imagem adicionada com sucesso'
        else
          flash[:error] = 'Erro ao adicionar a imagem: ' + result
        end
      else
        flash[:info] = 'Nenhuma imagem adicionada'
      end

      redirect_to create_admin_animal_imagens_path(@animal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def set_animal
    @animal = Animal.find_by(id: params[:animal_id])

    if @animal.nil?
      flash[:error] = 'Animal não encontrado'
      redirect_to admin_animais_path
    else
      @animal = @animal.decorate
    end
  end

  def set_repositories
    @animal_repository = AnimalRepository.new
  end

  def animal_imagem_params
    params.require(:animal).permit(
      :imagem,
      imagens: []
    )
  end
end