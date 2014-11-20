# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  create_table "candidatos", force: true do |t|
    t.string  "nome"
    t.integer "numero_partido"
    t.integer "numero_cargo"
    t.string  "caminho_photo"
    t.integer "numero"
  end

  create_table "cargos", primary_key: "numero", force: true do |t|
    t.string  "nome"
    t.integer "digitos"
  end

  create_table "partidos", force: true do |t|
    t.string  "nome"
    t.string  "sigla"
    t.integer "numero"
  end

  create_table "votacoes", force: true do |t|
    t.date "data"
    t.time "hora_inicio"
    t.time "hora_fim"
  end

end
