class AgendamentoStatus < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'agendamentos_status'

  AGENDAMENTO_STATUS_ENUM = {
    aguardando_confirmacao: 1, 
    confirmado: 2, 
    cancelado: 3,
    concluido: 4,
    falta: 5
  }.freeze

  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by', optional: true

  validates :nome, :descricao, presence: true
  validates :nome, :descricao, length: { maximum: 255 }
  validates :codigo, uniqueness: true

  before_create :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  def self.aguardando_confirmacao
    status = find_by(codigo: AgendamentoStatus::AGENDAMENTO_STATUS_ENUM[:aguardando_confirmacao])
    status.present? ? status.id : nil
  end

  def self.confirmado
    status = find_by(codigo: AgendamentoStatus::AGENDAMENTO_STATUS_ENUM[:confirmado])
    status.present? ? status.id : nil
  end

  def self.cancelado
    status = find_by(codigo: AgendamentoStatus::AGENDAMENTO_STATUS_ENUM[:cancelado])
    status.present? ? status.id : nil
  end

  def self.concluido
    status = find_by(codigo: AgendamentoStatus::AGENDAMENTO_STATUS_ENUM[:concluido])
    status.present? ? status.id : nil
  end

  def self.falta
    status = find_by(codigo: AgendamentoStatus::AGENDAMENTO_STATUS_ENUM[:falta])
    status.present? ? status.id : nil
  end

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
