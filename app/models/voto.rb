class Voto < ActiveRecord::Base
  belongs_to :candidato, :foreign_key=>"numero_candidato", :primary_key=>"numero"
end
