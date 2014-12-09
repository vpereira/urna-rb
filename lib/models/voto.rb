class Voto < ActiveRecord::Base
  belongs_to :candidato, :foreign_key=>"numero_candidato", :primary_key=>"numero"
  belongs_to :eleitor, :foreign_key=>"numero_eleitor", :primary_key=>"numero"
end
