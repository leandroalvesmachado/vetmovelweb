class Animal < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'animais'

  belongs_to :sexo, class_name: 'AnimalSexo', foreign_key: 'animal_sexo_id', optional: true
  belongs_to :pelagem, class_name: 'Pelagem', foreign_key: 'pelagem_id', optional: true
  belongs_to :especie, class_name: 'Especie', foreign_key: 'especie_id', optional: true
  belongs_to :raca, class_name: 'Raca', foreign_key: 'raca_id', optional: true
  belongs_to :autor, class_name: 'Usuario', foreign_key: 'created_by', optional: true
  has_many_attached :imagens do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end


  validates :nome, :animal_sexo_id, :especie_id, :obito, presence: true

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
