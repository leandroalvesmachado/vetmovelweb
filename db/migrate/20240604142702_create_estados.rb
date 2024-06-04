class CreateEstados < ActiveRecord::Migration[7.1]
  def change
    create_table :estados, id: :uuid do |t|
      t.uuid :pais_id, null: false
      t.string :nome, null: false
      t.string :sigla, null: false
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_index :estados, :sigla, unique: true
    add_foreign_key :estados, :paises, column: :pais_id, primary_key: "id"
    add_foreign_key :estados, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :estados, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :estados, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
