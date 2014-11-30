class CreateCargos < ActiveRecord::Migration
    def change
        create_table :cargos, :id=>false  do |t|
            t.string :nome
            t.integer :digitos
            t.integer :numero
            t.integer :numero_eleicao
            t.primary_key :numero
        end
    end
end
