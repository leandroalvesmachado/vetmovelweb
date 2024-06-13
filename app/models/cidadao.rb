class Cidadao < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'cidadaos'

  belongs_to :usuario, class_name: 'Usuario', foreign_key: 'usuario_id', optional: true
  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by', optional: true
  has_many :animais, class_name: 'Animal', foreign_key: 'cidadao_id', dependent: :destroy

  before_validation :remove_mask
  before_create :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by
  after_validation :remove_mask

  validates :cpf, :nome, :email, presence: true
  validates :cpf, uniqueness: true
  validates :cpf, length: { maximum: 11 }
  validates :rg, length: { maximum: 20 }, allow_blank: true
  validates :nome, length: { minimum: 3, maximum: 255 }
  validates :nome_social, length: { maximum: 255 }, allow_blank: true
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_uniqueness
  # validates :telefone, allow_blank: true, format: { with: /\A\d{2}\d{4,5}-\d{4}\z/, message: "formato inválido" }
  # validates :telefone, :celular, length: { minimum: 8, maximum: 9 }, allow_blank: true
  # validates :celular, allow_blank: true, format: { with: /\A\d{2}\d{4,5}-\d{4}\z/, message: "formato inválido" }

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
    self.cpf = cpf.gsub(/\D/, '') if cpf.present?
    self.telefone = telefone.gsub(/\D/, '') if telefone.present?
    self.celular = celular.gsub(/\D/, '') if celular.present?
    self.telefone_contato = telefone_contato.gsub(/\D/, '') if telefone_contato.present?
  end

  def email_uniqueness
    if Usuario.exists?(email: email)
      errors.add(:email, 'já está sendo usado por um usuário')
    end

    if Cidadao.exists?(email: email)
      errors.add(:email, 'já está sendo usado por um cidadão')
    end
  end
end
