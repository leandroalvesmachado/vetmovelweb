class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  
  # Adicione este método para sobrescrever o redirecionamento após o login
  def after_sign_in_path_for(resource)
    admin_root_path # ou qualquer rota que você desejar
  end
end
