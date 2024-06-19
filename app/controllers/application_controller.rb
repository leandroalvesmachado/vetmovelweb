class ApplicationController < ActionController::Base
  # Adicione este método para sobrescrever o redirecionamento após o login
  def after_sign_in_path_for(resource)
    admin_root_path # ou qualquer rota que você desejar
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
