class CreateCandidatos < ActiveRecord::Migration
    def change
        create_table :candidatos,:id=>false  do |t|
            t.string :nome
            t.integer :numero_partido
            t.integer :numero_cargo
            t.string :caminho_photo
            t.integer :numero
            t.primary_key :numero
        end
    end
end
