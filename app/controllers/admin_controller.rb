class AdminController < ApplicationController
  include Pagy::Backend

  layout "application"
  before_action :authenticate_usuario!, :set_current_usuario

  private

  def set_current_usuario
    Thread.current[:current_usuario] = current_usuario
  end
end
