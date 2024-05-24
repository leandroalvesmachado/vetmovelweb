class AdminController < ApplicationController
  include Pagy::Backend

  layout "application"
  before_action :authenticate_usuario!
end
