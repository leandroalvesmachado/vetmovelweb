# frozen_string_literal: true

class Admin::FlashMessageComponent < ViewComponent::Base
  attr_reader :type, :message

  def initialize(type:, message:)
    @type = type
    @message = message
  end

  private

  def flash_class
    case type
    when :success
      'success'
    when :error
      'danger'
    when :warning
      'warning'
    when :notice
      'info'
    else
      'info'
    end
  end

  def flash_icon_class
    case type
    when :success
      'icon fas fa-check'
    when :error
      'icon fas fa-ban'
    when :warning
      'icon fas fa-exclamation-triangle'
    when :notice
      'icon fas fa-info'
    else
      'icon fas fa-info'
    end
  end
end
