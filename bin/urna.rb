require 'jrubyfx'
require_relative "../urna"
require_relative '../lib/db'

Urna::Db::init(:config=>'config/database.yml',:env=>'development')




require_relative "../app/controllers/urna"


module Urna
class Urna <  JRubyFX::Application
    def start(stage)

         # entre o titulo de eleitor
         lbl1 = label "Entre o titulo de eleitor"
         txt1 = text_field
         btn1 = button "OK"

         # TODO
         # dont use Eleicao.first, but the active one
         cargos = Eleicao.first.cargos.to_a


         pane = vbox 10
         pane.add lbl1
         pane.add txt1
         pane.add btn1
         pane.set_alignment(Pos::CENTER)
         scene1 = scene(pane,250,150)
         stage.scene = scene1
         stage.title = "Urna Eletronica - Brasileira"
         stage.show

         eleitor = Eleitor.new :titulo_de_eleitor=>txt1.text.to_s
         # TODO
         # dont use Eleicao.first, but the active one
         eleitor.eleicao = Eleicao.first

         btn1.set_on_action  do |e|
           #puts cargo.nome
           UrnaController.load_into(stage,:initialize=>[:eleitor=>eleitor,
               :cargos=>cargos])
         end
    end
end
end


Urna::Urna.launch
