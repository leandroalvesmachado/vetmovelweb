class Cirurgia < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'cirurgias'

  validates :nome, presence: true
  validates :descricao, presence: true

  before_create :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  private

  def set_created_by
    self.created_by = Thread.current[:current_usuario].id
    self.updated_by = Thread.current[:current_usuario].id
  end

  def set_updated_by
    self.updated_by = Thread.current[:current_usuario].id
  end

  def set_deleted_by
    self.deleted_by = Thread.current[:current_usuario].id
  end
end
