class CreateCargos < ActiveRecord::Migration
    def change
        create_table :cargos  do |t|
            t.string :nome
            t.integer :digitos
            t.integer :numero, primary_key: true
        end
    end
end
