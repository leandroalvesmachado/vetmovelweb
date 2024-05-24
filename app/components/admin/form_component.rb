# frozen_string_literal: true

class Admin::FormComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :action, :method, :model, :back_url, :submit_text
  attr_reader :form_builder, :errors

  def initialize(title: '', subtitle: '', action: '#', method: 'GET', model: nil, back_url: '#', submit_text: 'Salvar')
    @title = title
    @subtitle = subtitle
    @action = action
    @method = method
    @model = model
    @back_url = back_url
    @submit_text = submit_text
  end
end
