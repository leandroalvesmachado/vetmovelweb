class CreateAnimais < ActiveRecord::Migration[7.1]
  def change
    create_table :animais, id: :uuid do |t|
      t.uuid :cidadao_id, null: false
      t.string :nome, null: false
      t.uuid :animal_sexo_id, null: false
      t.datetime :data_nascimento, null: true
      t.uuid :pelagem_id, null: true
      t.uuid :especie_id, null: false
      t.uuid :raca_id, null: true
      t.boolean :castrado, null: true, default: nil
      t.boolean :obito, null: false, default: false
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_foreign_key :animais, :cidadaos, column: :cidadao_id, primary_key: "id"
    add_foreign_key :animais, :animais_sexos, column: :animal_sexo_id, primary_key: "id"
    add_foreign_key :animais, :pelagens, column: :pelagem_id, primary_key: "id"
    add_foreign_key :animais, :especies, column: :especie_id, primary_key: "id"
    add_foreign_key :animais, :racas, column: :raca_id, primary_key: "id"
    add_foreign_key :animais, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :animais, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :animais, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
