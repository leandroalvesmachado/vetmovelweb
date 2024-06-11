class Animal < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'animais'

  belongs_to :cidadao, class_name: 'Cidadao', foreign_key: 'cidadao_id', optional: true
  belongs_to :sexo, class_name: 'AnimalSexo', foreign_key: 'animal_sexo_id'
  belongs_to :pelagem, class_name: 'Pelagem', foreign_key: 'pelagem_id', optional: true
  belongs_to :especie, class_name: 'Especie', foreign_key: 'especie_id'
  belongs_to :raca, class_name: 'Raca', foreign_key: 'raca_id', optional: true
  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by', optional: true
  has_one_attached :imagem
  has_many_attached :imagens do |attachable|
    attachable.variant(:thumbnail, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end

  validates :rga, uniqueness: true
  validates :nome, :animal_sexo_id, :especie_id, presence: true
  validates :castrado, presence: true, if: -> { castrado.nil? }
  validates :obito, presence: true, if: -> { obito.nil? }
  validates :imagem, content_type: ['image/png', 'image/jpg', 'image/jpeg'], 
    size: { between: 1..5.megabytes },
    dimension: { width: { max: 350 }, height: { max: 350 } },
    on: :animais_imagens
  validates :imagens, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size: { between: 1..5.megabytes },
    dimension: { width: { max: 350 }, height: { max: 350 } },
    on: :animais_imagens


  before_validation :numero_rga, on: :create
  before_create :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by, :purge_attachments

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

  def purge_attachments
    avatar.purge if avatar.attached?
    imagens.each(&:purge)
  end

  def numero_rga
    created_at = Time.current
    created_at_formatted = created_at.strftime('%Y%m%d')

    # Obtém o último número RGA para a mesma data de criação
    count = Animal.where("extract(year from created_at) = ? AND extract(month from created_at) = ?", created_at.year, created_at.month).count
    rga = count + 1

    self.rga = "#{created_at_formatted}#{rga}"
  end
end
