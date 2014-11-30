class CreateEleicoes < ActiveRecord::Migration
    def change
        create_table :eleicoes, :id=>false do |t|
            t.date :data, primary_key:true
            t.integer :numero
            t.time :hora_inicio
            t.time :hora_fim
            t.primary_key :numero
        end
    end
end
