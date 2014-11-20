class CreateVotacoes < ActiveRecord::Migration
    def change
        create_table :votacoes do |t|
            t.date :data, primary_key:true
            t.time :hora_inicio
            t.time :hora_fim
        end
    end
end
