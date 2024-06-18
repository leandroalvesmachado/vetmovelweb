class Agendamento < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'agendamentos'

  belongs_to :agenda, class_name: 'Agenda', foreign_key: 'agenda_id'
  belongs_to :cidadao, class_name: 'Cidadao', foreign_key: 'cidadao_id'
  belongs_to :animal, class_name: 'Animal', foreign_key: 'animal_id'
  belongs_to :servico, class_name: 'Servico', foreign_key: 'servico_id'
  belongs_to :status, class_name: 'AgendamentoStatus', foreign_key: 'agendamento_status_id', optional: true
  belongs_to :funcionario, class_name: 'Usuario', foreign_key: 'funcionario_id'
  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by', optional: true

  validates :agenda_id, :cidadao_id, :animal_id, :servico_id, :funcionario_id, presence: true
  validates :data, presence: true, format: { with: /(\d{4})-(\d{2})-(\d{2})/, message: "deve estar no formato DD/MM/YYYY" }
  validates :hora_inicio, presence: true, format: { with: /([01]?[0-9]|2[0-3]):[0-5][0-9]/, message: "deve estar no formato HH:MM:SS e no intervalo de 00:00:00 até 23:59:59" }
  validates :hora_fim, presence: true, format: { with: /([01]?[0-9]|2[0-3]):[0-5][0-9]/, message: "deve estar no formato HH:MM:SS e no intervalo de 00:00:00 até 23:59:59" }
  validates :observacao, length: { maximum: 500 }, allow_blank: true
  validates :agendamento_status_id, presence: true, on: :update
  validate :horario

  before_validation :remove_mask
  before_create :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  def has_agenda?(agenda_codigo)
    agenda&.codigo == agenda_codigo
  end

  def is_cirurgia?
    has_agenda?(Agenda::AGENDA_ENUM[:cirurgia])
  end

  def is_consulta?
    has_agenda?(Agenda::AGENDA_ENUM[:consulta])
  end

  def is_exame?
    has_agenda?(Agenda::AGENDA_ENUM[:exame])
  end

  def is_vacina?
    has_agenda?(Agenda::AGENDA_ENUM[:vacina])
  end

  def is_retorno?
    has_agenda?(Agenda::AGENDA_ENUM[:retorno])
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

  def remove_mask
    #self.data = data.gsub(/\D/, '') if data.present?
  end

  def horario
    if hora_inicio.present? && hora_fim.present? && hora_inicio >= hora_fim
      errors.add(:hora_fim, 'deve ser maior que o Horário de início')
    end
  end
end
