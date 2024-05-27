# frozen_string_literal: true

class Admin::ModalComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :target, :size, :model

  def initialize(title: '', subtitle: '', target: '#', size: 'lg', model: nil)
    @title = title
    @subtitle = subtitle
    @target = target
    @size = size
    @model = model
  end
end
