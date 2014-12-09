class Partido < ActiveRecord::Base
    has_many :candidatos, :foreign_key=>"numero_partido",:primary_key=>"numero"
end
