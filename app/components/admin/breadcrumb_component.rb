# frozen_string_literal: true

class Admin::BreadcrumbComponent < ViewComponent::Base
  renders_one :title
  renders_many :links, 'Admin::BreadcrumbComponent::LinkComponent'

  def initialize; end

  class LinkComponent < ViewComponent::Base
    attr_reader :name, :link

    def initialize(name:, link:)
      @name = name
      @link = link
    end
  end
end
