# frozen_string_literal: true

class Admin::CardComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :model, :back_url

  def initialize(title: '', subtitle: '', back_url: '#')
    @title = title
    @subtitle = subtitle
    @back_url = back_url
  end
end
