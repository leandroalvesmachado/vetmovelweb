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

ActiveRecord::Schema[7.1].define(version: 2024_05_22_173809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

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

  create_table "servicos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome", null: false
    t.text "descricao", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_usuarios_on_deleted_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "vacinas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

  add_foreign_key "animais_sexos", "usuarios", column: "created_by"
  add_foreign_key "animais_sexos", "usuarios", column: "deleted_by"
  add_foreign_key "animais_sexos", "usuarios", column: "updated_by"
  add_foreign_key "cirurgias", "usuarios", column: "created_by"
  add_foreign_key "cirurgias", "usuarios", column: "deleted_by"
  add_foreign_key "cirurgias", "usuarios", column: "updated_by"
  add_foreign_key "especies", "usuarios", column: "created_by"
  add_foreign_key "especies", "usuarios", column: "deleted_by"
  add_foreign_key "especies", "usuarios", column: "updated_by"
  add_foreign_key "exames", "usuarios", column: "created_by"
  add_foreign_key "exames", "usuarios", column: "deleted_by"
  add_foreign_key "exames", "usuarios", column: "updated_by"
  add_foreign_key "generos", "usuarios", column: "created_by"
  add_foreign_key "generos", "usuarios", column: "deleted_by"
  add_foreign_key "generos", "usuarios", column: "updated_by"
  add_foreign_key "pelagens", "usuarios", column: "created_by"
  add_foreign_key "pelagens", "usuarios", column: "deleted_by"
  add_foreign_key "pelagens", "usuarios", column: "updated_by"
  add_foreign_key "racas", "especies", column: "especie_id"
  add_foreign_key "racas", "usuarios", column: "created_by"
  add_foreign_key "racas", "usuarios", column: "deleted_by"
  add_foreign_key "racas", "usuarios", column: "updated_by"
  add_foreign_key "servicos", "usuarios", column: "created_by"
  add_foreign_key "servicos", "usuarios", column: "deleted_by"
  add_foreign_key "servicos", "usuarios", column: "updated_by"
  add_foreign_key "vacinas", "usuarios", column: "created_by"
  add_foreign_key "vacinas", "usuarios", column: "deleted_by"
  add_foreign_key "vacinas", "usuarios", column: "updated_by"
  add_foreign_key "vermifugos", "usuarios", column: "created_by"
  add_foreign_key "vermifugos", "usuarios", column: "deleted_by"
  add_foreign_key "vermifugos", "usuarios", column: "updated_by"
end
