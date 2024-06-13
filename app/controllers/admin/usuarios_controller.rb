class Admin::UsuariosController < AdminController
  before_action :set_repositories, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_dependencies, only: [:index, :new, :edit, :create, :update]
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @usuarios = @usuario_repository.paginate(params)
    @pagy, @usuarios = pagy(@usuarios)
    @usuarios = @usuarios.map(&:decorate)
  end

  def show; end

  def new
    @usuario = Usuario.new
    @usuario.usuario_perfis.build
  end

  def edit
  end
  
  def create
    @usuario = Usuario.new(usuario_params)
    
    if @usuario.valid?
      result = @usuario_repository.create(usuario_params)

      if result == true
        flash[:success] = 'Usuário cadastrado com sucesso'
        redirect_to admin_usuarios_path
      else
        flash[:error] = 'Erro ao cadastrar o usuário: ' + result
        redirect_to new_admin_usuario_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @usuario.assign_attributes(usuario_params)
    
    if @usuario.valid?
      result = @usuario_repository.update(@usuario, usuario_params)

      if result == true
        flash[:success] = 'Usuário atualizado com sucesso'
      else
        flash[:error] = 'Erro ao atualizar o usuário: ' + result
      end

      redirect_to edit_admin_usuario_path(@usuario)
    else
      unless @usuario.usuario_perfis.empty?
        @usuario.usuario_perfis = [@usuario.usuario_perfis.first]
      end
      
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @usuario_repository.destroy(@usuario)
    
    if result == true
      flash[:success] = 'Usuário deletado com sucesso'
    else
      flash[:error] = 'Erro ao deletar o usuário: ' + result
    end

    redirect_to admin_usuarios_path
  end

  private

  def set_repositories
    @usuario_repository = UsuarioRepository.new
    @perfil_repository = PerfilRepository.new
  end

  def set_dependencies
    @perfis = @perfil_repository.select_option()
  end

  def usuario_params
    params.require(:usuario).permit(
      :nome, 
      :email,
      usuario_perfis_attributes: [:id, :perfil_id]
    )
  end

  def set_usuario
    @usuario = Usuario.find_by(id: params[:id])

    if @usuario.nil?
      flash[:error] = 'Usuário não encontrado'
      redirect_to admin_usuarios_path
    else
      @usuario = @usuario.decorate
    end
  end
end