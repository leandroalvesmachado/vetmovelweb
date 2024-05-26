# frozen_string_literal: true

class Admin::FlashMessageComponent < ViewComponent::Base
  attr_reader :flash

  FLASH_CLASSES = {
    success: { css: 'alert-success', icon: 'icon fas fa-check' },
    error: { css: 'alert-danger', icon: 'icon fas fa-ban' },
    warning: { css: 'alert-warning', icon: 'icon fas fa-exclamation-triangle' },
    notice: { css: 'alert-info', icon: 'icon fas fa-info' },
    default: { css: 'alert-info', icon: 'icon fas fa-info' }
  }.freeze

  def initialize(flash:)
    @flash = flash
    super
  end

  private

  def flash_class(type)
    FLASH_CLASSES.fetch(type.to_sym, FLASH_CLASSES[:default])[:css]
  end

  def flash_icon_class(type)
    FLASH_CLASSES.fetch(type.to_sym, FLASH_CLASSES[:default])[:icon]
  end
end
