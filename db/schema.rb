# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_13_174909) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agendamentos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "agenda_id", null: false
    t.uuid "cidadao_id", null: false
    t.uuid "animal_id", null: false
    t.uuid "servico_id", null: false
    t.datetime "data", null: false
    t.time "hora_inicio", precision: 0, null: false
    t.time "hora_fim", precision: 0, null: false
    t.uuid "funcionario_id", null: false
    t.text "observacao"
    t.uuid "agendamento_status_id", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_agendamentos_on_deleted_at"
  end

  create_table "agendamentos_status", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo", null: false
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["codigo"], name: "index_agendamentos_status_on_codigo", unique: true
    t.index ["deleted_at"], name: "index_agendamentos_status_on_deleted_at"
  end

  create_table "agendas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo", null: false
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["codigo"], name: "index_agendas_on_codigo", unique: true
    t.index ["deleted_at"], name: "index_agendas_on_deleted_at"
  end

  create_table "animais", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "rga", null: false
    t.uuid "cidadao_id", null: false
    t.string "nome", null: false
    t.uuid "animal_sexo_id", null: false
    t.datetime "data_nascimento"
    t.string "chip"
    t.uuid "pelagem_id"
    t.uuid "especie_id", null: false
    t.uuid "raca_id"
    t.boolean "castrado", null: false
    t.boolean "obito", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_animais_on_deleted_at"
    t.index ["rga"], name: "index_animais_on_rga", unique: true
  end

  create_table "animais_sexos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_animais_sexos_on_deleted_at"
  end

  create_table "antipulgas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.decimal "preco", precision: 8, scale: 2
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_antipulgas_on_deleted_at"
  end

  create_table "cidadaos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "usuario_id", null: false
    t.string "cpf", null: false
    t.string "rg"
    t.string "nome", null: false
    t.string "nome_social"
    t.datetime "data_nascimento"
    t.string "email", null: false
    t.string "telefone"
    t.string "celular"
    t.string "telefone_contato"
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["cpf"], name: "index_cidadaos_on_cpf", unique: true
    t.index ["deleted_at"], name: "index_cidadaos_on_deleted_at"
  end

  create_table "cirurgias", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_cirurgias_on_deleted_at"
  end

  create_table "especies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_especies_on_deleted_at"
  end

  create_table "estados", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "pais_id", null: false
    t.string "nome", null: false
    t.string "sigla", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_estados_on_deleted_at"
    t.index ["sigla"], name: "index_estados_on_sigla", unique: true
  end

  create_table "exames", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_exames_on_deleted_at"
  end

  create_table "generos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_generos_on_deleted_at"
  end

  create_table "municipios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "estado_id", null: false
    t.string "nome", null: false
    t.string "codigo_ibge", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["codigo_ibge"], name: "index_municipios_on_codigo_ibge", unique: true
    t.index ["deleted_at"], name: "index_municipios_on_deleted_at"
  end

  create_table "paises", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_paises_on_deleted_at"
  end

  create_table "pelagens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_pelagens_on_deleted_at"
  end

  create_table "perfis", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo", null: false
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["codigo"], name: "index_perfis_on_codigo", unique: true
    t.index ["deleted_at"], name: "index_perfis_on_deleted_at"
  end

  create_table "racas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "especie_id", null: false
    t.string "nome", null: false
    t.text "descricao", null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_racas_on_deleted_at"
  end

  create_table "regionais", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "municipio_id", null: false
    t.string "nome", null: false
    t.string "sigla"
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_regionais_on_deleted_at"
  end

  create_table "servicos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.decimal "preco", precision: 10, scale: 2
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_servicos_on_deleted_at"
  end

  create_table "usuarios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_usuarios_on_deleted_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "usuarios_perfis", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "usuario_id", null: false
    t.uuid "perfil_id", null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_usuarios_perfis_on_deleted_at"
    t.index ["usuario_id", "perfil_id"], name: "index_usuarios_perfis_on_usuario_id_and_perfil_id", unique: true
  end

  create_table "vacinas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.decimal "preco", precision: 10, scale: 2
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_vacinas_on_deleted_at"
  end

  create_table "vermifugos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
    t.decimal "preco", precision: 8, scale: 2
    t.boolean "vermifugo", default: false, null: false
    t.boolean "antipulga", default: false, null: false
    t.boolean "ativo", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_vermifugos_on_deleted_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agendamentos", "agendamentos_status", column: "agendamento_status_id"
  add_foreign_key "agendamentos", "agendas"
  add_foreign_key "agendamentos", "animais"
  add_foreign_key "agendamentos", "cidadaos"
  add_foreign_key "agendamentos", "servicos"
  add_foreign_key "agendamentos", "usuarios", column: "created_by"
  add_foreign_key "agendamentos", "usuarios", column: "deleted_by"
  add_foreign_key "agendamentos", "usuarios", column: "funcionario_id"
  add_foreign_key "agendamentos", "usuarios", column: "updated_by"
  add_foreign_key "agendamentos_status", "usuarios", column: "created_by"
  add_foreign_key "agendamentos_status", "usuarios", column: "deleted_by"
  add_foreign_key "agendamentos_status", "usuarios", column: "updated_by"
  add_foreign_key "agendas", "usuarios", column: "created_by"
  add_foreign_key "agendas", "usuarios", column: "deleted_by"
  add_foreign_key "agendas", "usuarios", column: "updated_by"
  add_foreign_key "animais", "animais_sexos"
  add_foreign_key "animais", "cidadaos"
  add_foreign_key "animais", "especies"
  add_foreign_key "animais", "pelagens"
  add_foreign_key "animais", "racas"
  add_foreign_key "animais", "usuarios", column: "created_by"
  add_foreign_key "animais", "usuarios", column: "deleted_by"
  add_foreign_key "animais", "usuarios", column: "updated_by"
  add_foreign_key "animais_sexos", "usuarios", column: "created_by"
  add_foreign_key "animais_sexos", "usuarios", column: "deleted_by"
  add_foreign_key "animais_sexos", "usuarios", column: "updated_by"
  add_foreign_key "antipulgas", "usuarios", column: "created_by"
  add_foreign_key "antipulgas", "usuarios", column: "deleted_by"
  add_foreign_key "antipulgas", "usuarios", column: "updated_by"
  add_foreign_key "cidadaos", "usuarios"
  add_foreign_key "cidadaos", "usuarios", column: "created_by"
  add_foreign_key "cidadaos", "usuarios", column: "deleted_by"
  add_foreign_key "cidadaos", "usuarios", column: "updated_by"
  add_foreign_key "cirurgias", "usuarios", column: "created_by"
  add_foreign_key "cirurgias", "usuarios", column: "deleted_by"
  add_foreign_key "cirurgias", "usuarios", column: "updated_by"
  add_foreign_key "especies", "usuarios", column: "created_by"
  add_foreign_key "especies", "usuarios", column: "deleted_by"
  add_foreign_key "especies", "usuarios", column: "updated_by"
  add_foreign_key "estados", "paises", column: "pais_id"
  add_foreign_key "estados", "usuarios", column: "created_by"
  add_foreign_key "estados", "usuarios", column: "deleted_by"
  add_foreign_key "estados", "usuarios", column: "updated_by"
  add_foreign_key "exames", "usuarios", column: "created_by"
  add_foreign_key "exames", "usuarios", column: "deleted_by"
  add_foreign_key "exames", "usuarios", column: "updated_by"
  add_foreign_key "generos", "usuarios", column: "created_by"
  add_foreign_key "generos", "usuarios", column: "deleted_by"
  add_foreign_key "generos", "usuarios", column: "updated_by"
  add_foreign_key "municipios", "estados"
  add_foreign_key "municipios", "usuarios", column: "created_by"
  add_foreign_key "municipios", "usuarios", column: "deleted_by"
  add_foreign_key "municipios", "usuarios", column: "updated_by"
  add_foreign_key "paises", "usuarios", column: "created_by"
  add_foreign_key "paises", "usuarios", column: "deleted_by"
  add_foreign_key "paises", "usuarios", column: "updated_by"
  add_foreign_key "pelagens", "usuarios", column: "created_by"
  add_foreign_key "pelagens", "usuarios", column: "deleted_by"
  add_foreign_key "pelagens", "usuarios", column: "updated_by"
  add_foreign_key "perfis", "usuarios", column: "created_by"
  add_foreign_key "perfis", "usuarios", column: "deleted_by"
  add_foreign_key "perfis", "usuarios", column: "updated_by"
  add_foreign_key "racas", "especies"
  add_foreign_key "racas", "usuarios", column: "created_by"
  add_foreign_key "racas", "usuarios", column: "deleted_by"
  add_foreign_key "racas", "usuarios", column: "updated_by"
  add_foreign_key "regionais", "municipios"
  add_foreign_key "regionais", "usuarios", column: "created_by"
  add_foreign_key "regionais", "usuarios", column: "deleted_by"
  add_foreign_key "regionais", "usuarios", column: "updated_by"
  add_foreign_key "servicos", "usuarios", column: "created_by"
  add_foreign_key "servicos", "usuarios", column: "deleted_by"
  add_foreign_key "servicos", "usuarios", column: "updated_by"
  add_foreign_key "usuarios_perfis", "perfis", column: "perfil_id"
  add_foreign_key "usuarios_perfis", "usuarios"
  add_foreign_key "usuarios_perfis", "usuarios", column: "created_by"
  add_foreign_key "usuarios_perfis", "usuarios", column: "deleted_by"
  add_foreign_key "usuarios_perfis", "usuarios", column: "updated_by"
  add_foreign_key "vacinas", "usuarios", column: "created_by"
  add_foreign_key "vacinas", "usuarios", column: "deleted_by"
  add_foreign_key "vacinas", "usuarios", column: "updated_by"
  add_foreign_key "vermifugos", "usuarios", column: "created_by"
  add_foreign_key "vermifugos", "usuarios", column: "deleted_by"
  add_foreign_key "vermifugos", "usuarios", column: "updated_by"
end
