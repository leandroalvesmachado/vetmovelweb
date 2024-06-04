class Usuario < ApplicationRecord
  acts_as_paranoid
  self.table_name = 'usuarios'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :usuario_perfis, class_name: 'UsuarioPerfil', foreign_key: 'usuario_id', dependent: :destroy

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
end
