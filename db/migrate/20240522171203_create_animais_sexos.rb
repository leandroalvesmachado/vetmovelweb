class CreateAnimaisSexos < ActiveRecord::Migration[7.1]
  def change
    create_table :animais_sexos, id: :uuid do |t|
      t.string :nome, null: false
      t.text :descricao, null: false
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_foreign_key :animais_sexos, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :animais_sexos, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :animais_sexos, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
