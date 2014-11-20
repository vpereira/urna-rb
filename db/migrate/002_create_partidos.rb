class CreatePartidos < ActiveRecord::Migration
    def change
        create_table :partidos, :id=>false do |t|
            t.string :nome
            t.string :sigla
            t.integer :numero
            t.primary_key :numero
        end
    end
end
