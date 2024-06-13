class CreateCidadaos < ActiveRecord::Migration[7.1]
  def change
    create_table :cidadaos, id: :uuid do |t|
      t.uuid :usuario_id, null: false
      t.string :cpf, null: false
      t.string :rg, null: true
      t.string :nome, null: false
      t.string :nome_social, null: true
      t.datetime :data_nascimento, null: true
      t.string :email, null: false
      t.string :telefone, null: true
      t.string :celular, null: true
      t.string :telefone_contato, null: true
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_index :cidadaos, :cpf, unique: true
    add_foreign_key :cidadaos, :usuarios, column: :usuario_id, primary_key: "id"
    add_foreign_key :cidadaos, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :cidadaos, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :cidadaos, :usuarios, column: :deleted_by, primary_key: "id"
  end
end