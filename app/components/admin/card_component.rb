# frozen_string_literal: true

class Admin::CardComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :model, :back_url, :footer

  def initialize(title: '', subtitle: '', back_url: '#', footer: true)
    @title = title
    @subtitle = subtitle
    @back_url = back_url
    @footer = footer
  end
end
