# frozen_string_literal: true

class Admin::TableComponent < ViewComponent::Base
  include Pagy::Frontend
  attr_reader :icon, :title, :subtitle, :headers, :records, :pagy
  
  def initialize(icon: '', title: '', subtitle: '', headers: [], records: [], pagy: [])
    @icon = icon
    @title = title
    @subtitle = subtitle
    @headers = headers
    @records = records
    @pagy = pagy
  end
end
