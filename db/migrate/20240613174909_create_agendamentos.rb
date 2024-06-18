class CreateAgendamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :agendamentos, id: :uuid do |t|
      t.uuid :agenda_id, null: false
      t.uuid :cidadao_id, null: false
      t.uuid :animal_id, null: false
      t.uuid :servico_id, null: false
      t.datetime :data, null: false
      t.time :hora_inicio, precision: 0, null: false
      t.time :hora_fim, precision: 0, null: false
      t.uuid :funcionario_id, null: false
      t.text :observacao, null: true
      t.uuid :agendamento_status_id, null: false
      t.boolean :ativo, null: false, default: true
      t.uuid :created_by, null: false
      t.uuid :updated_by, null: false
      t.uuid :deleted_by, null: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_foreign_key :agendamentos, :agendas, column: :agenda_id, primary_key: "id"
    add_foreign_key :agendamentos, :cidadaos, column: :cidadao_id, primary_key: "id"
    add_foreign_key :agendamentos, :animais, column: :animal_id, primary_key: "id"
    add_foreign_key :agendamentos, :servicos, column: :servico_id, primary_key: "id"
    add_foreign_key :agendamentos, :agendamentos_status, column: :agendamento_status_id, primary_key: "id"
    add_foreign_key :agendamentos, :usuarios, column: :funcionario_id, primary_key: "id"
    add_foreign_key :agendamentos, :usuarios, column: :created_by, primary_key: "id"
    add_foreign_key :agendamentos, :usuarios, column: :updated_by, primary_key: "id"
    add_foreign_key :agendamentos, :usuarios, column: :deleted_by, primary_key: "id"
  end
end
