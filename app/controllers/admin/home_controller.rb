class Admin::HomeController < AdminController
  before_action :authenticate_usuario!
  def index; end
end
