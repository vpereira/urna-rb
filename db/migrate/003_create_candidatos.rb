class CreateCandidatos < ActiveRecord::Migration
    def change
        create_table :candidatos  do |t|
            t.string :nome
            t.integer :numero_partido
            t.integer :numero_cargo
            t.string :caminho_photo
            t.integer :numero, primary_key: true
        end
    end
end
