# frozen_string_literal: true

class Admin::ModalComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :target, :model, :size
  renders_one :body
  renders_one :footer

  def initialize(title: '', subtitle: '', target: '#', model: nil, size: 'xl')
    @title = title
    @subtitle = subtitle
    @target = target
    @model = model
    @size = size
  end
end
