class Agendamento < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'agendamentos'

  belongs_to :cidadao, class_name: 'Cidadao', foreign_key: 'cidadao_id'
  belongs_to :animal, class_name: 'Animal', foreign_key: 'animal_id'
  belongs_to :servico, class_name: 'Servico', foreign_key: 'servico_id'
  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by', optional: true

  validates :cidadao_id, :animal_id, :servico_id, :data, presence: true

  before_create :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  private

  def set_created_by
    self.created_by ||= Thread.current[:current_usuario].try(:id)
    self.updated_by ||= Thread.current[:current_usuario].try(:id)
  end

  def set_updated_by
    self.updated_by ||= Thread.current[:current_usuario].try(:id)
  end

  def set_deleted_by
    self.deleted_by ||= Thread.current[:current_usuario].try(:id)
    # Salvar o registro sem validações, caso contrário ele não será salvo se estiver sendo destruído
    save(validate: false)
  end
end
