# frozen_string_literal: true

class Admin::BadgeComponent < ViewComponent::Base
  attr_reader :badge_title, :badge_class
  
  def initialize(badge_title: '', badge_class: '')
    @badge_title = badge_title
    @badge_class = badge_class
  end
end
