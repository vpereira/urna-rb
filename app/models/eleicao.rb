class Eleicao < ActiveRecord::Base
  # i though the inflections would take care of it
  self.table_name = "eleicoes"
  has_many :cargos, :foreign_key=>"numero_eleicao",:primary_key=>"numero"
  has_many :eleitores, :foreign_key=>"numero_eleicao",:primary_key=>"numero"
end
