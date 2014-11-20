class Candidato < ActiveRecord::Base
    belongs_to :partido, :foreign_key=>"numero_partido",:primary_key=>"numero"
    belongs_to :cargo, :foreign_key=>"numero_cargo",:primary_key=>"numero"
end
