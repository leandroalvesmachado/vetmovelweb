# frozen_string_literal: true

class Admin::FormSearchComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :action, :method, :submit_text
  attr_reader :form_builder

  def initialize(title: '', subtitle: '', action: '#', method: 'GET', submit_text: 'Pesquisar')
    @title = title
    @subtitle = subtitle
    @action = action
    @method = method
    @submit_text = submit_text
  end
end
