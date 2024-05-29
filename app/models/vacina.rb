class Vacina < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'vacinas'

  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by',optional: true

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
    # Salvar o registro sem validações, caso contrário ele não será salvo se estiver sendo destruído
    save(validate: false)
  end
end
