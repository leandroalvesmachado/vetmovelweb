class CreateUsuariosPerfis < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios_perfis, id: :uuid do |t|
      t.uuid :usuario_id, null: false
      t.uuid :perfil_id, null: false
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_index :usuarios_perfis, [:usuario_id, :perfil_id], unique: true
    add_foreign_key :usuarios_perfis, :usuarios, column: :usuario_id, primary_key: "id"
    add_foreign_key :usuarios_perfis, :perfis, column: :perfil_id, primary_key: "id"
    add_foreign_key :usuarios_perfis, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :usuarios_perfis, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :usuarios_perfis, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
