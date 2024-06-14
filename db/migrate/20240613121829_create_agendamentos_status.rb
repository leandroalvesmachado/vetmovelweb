class CreateAgendamentosStatus < ActiveRecord::Migration[7.1]
  def change
    create_table :agendamentos_status, id: :uuid do |t|
      t.integer :codigo, null: false
      t.string :nome, null: false
      t.text :descricao, null: false
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_index :agendamentos_status, :codigo, unique: true
    add_foreign_key :agendamentos_status, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :agendamentos_status, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :agendamentos_status, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
