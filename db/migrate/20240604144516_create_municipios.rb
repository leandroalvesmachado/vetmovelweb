class CreateMunicipios < ActiveRecord::Migration[7.1]
  def change
    create_table :municipios, id: :uuid do |t|
      t.uuid :estado_id, null: false
      t.string :nome, null: false
      t.string :codigo_ibge, null: false
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_index :municipios, :codigo_ibge, unique: true
    add_foreign_key :municipios, :estados, column: :estado_id, primary_key: "id"
    add_foreign_key :municipios, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :municipios, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :municipios, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
