class AdminController < ApplicationController
  include Pagy::Backend
  include Pundit

  layout "application"
  before_action :authenticate_usuario!, :set_current_usuario

  # Sobrescreva o método current_user para usar current_usuario
  def current_user
    current_usuario
  end

  # Pundit: resgate da exceção NotAuthorizedError e método usuario_not_authorized
  rescue_from Pundit::NotAuthorizedError, with: :usuario_not_authorized

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end

  def usuario_not_authorized
    flash[:alert] = "Você não está autorizado a realizar esta ação."
    redirect_to(root_path)
  end
end
