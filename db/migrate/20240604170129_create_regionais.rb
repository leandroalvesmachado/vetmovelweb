class CreateRegionais < ActiveRecord::Migration[7.1]
  def change
    create_table :regionais, id: :uuid do |t|
      t.uuid :municipio_id, null: false
      t.string :nome, null: false
      t.string :sigla, null: true
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_foreign_key :regionais, :municipios, column: :municipio_id, primary_key: "id"
    add_foreign_key :regionais, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :regionais, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :regionais, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
