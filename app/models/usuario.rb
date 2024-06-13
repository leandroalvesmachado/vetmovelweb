class Usuario < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'usuarios'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :usuario_perfis, class_name: 'UsuarioPerfil', foreign_key: 'usuario_id', dependent: :destroy
  has_one :cidadao, class_name: 'Cidadao', foreign_key: 'usuario_id', dependent: :destroy
  accepts_nested_attributes_for :usuario_perfis

  validates :nome, :email, presence: true
  validates :nome, :email, length: { maximum: 255 }
  validates :email, uniqueness: true

  # Sobrescreva o método password_required? do Devise
  def password_required?
    new_record? ? false : super
  end

  # Método para verificar se o usuário possui um perfil
  def has_perfil?(perfil_codigo)
    usuario_perfis.any? { |usuario_perfil| usuario_perfil.perfil.codigo == perfil_codigo }
  end

  def is_admin?
    has_perfil?(Perfil::PERFIL_ENUM[:admin])
  end

  def is_central?
    has_perfil?(Perfil::PERFIL_ENUM[:central])
  end

  def is_cidadao?
    has_perfil?(Perfil::PERFIL_ENUM[:cidadao])
  end

  def is_funcionario?
    has_perfil?(Perfil::PERFIL_ENUM[:funcionario])
  end
end
