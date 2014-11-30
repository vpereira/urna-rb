class Candidato < ActiveRecord::Base
    belongs_to :partido, :foreign_key=>"numero_partido",:primary_key=>"numero"
    belongs_to :cargo, :foreign_key=>"numero_cargo",:primary_key=>"numero"
    has_many :votos, :foreign_key=>"numero_candidato", :primary_key=>"numero", :dependent=>:destroy 

    def photo
      "file://#{File.expand_path(File.join(File.dirname(__FILE__),'..','..','images',self.caminho_photo))}"
    end
end
