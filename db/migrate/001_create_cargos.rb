class CreateCargos < ActiveRecord::Migration
    def change
        create_table :cargos do |t|
            t.string :nome
            t.integer :digitos
        end
    end
end
