require 'jrubyfx'
require_relative "../urna"
require_relative '../lib/db'

Urna::Db::init(:config=>'config/database.yml',:env=>'development')




require_relative "../app/controllers/urna"


module Urna
class Urna <  JRubyFX::Application
    def start(stage)

         #ENCERRA SCENE
         lbl_encerra = label "FIM"
         pane_encerra = vbox 10
         pane_encerra.add lbl_encerra
         encerra = scene(pane_encerra,250,250)

         # entre o titulo de eleitor
         lbl1 = label "Entre o titulo de eleitor"
         txt1 = text_field
         btn1 = button "OK"

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

         btn1.set_on_action  do |e|
           #puts cargo.nome
           UrnaController.load_into(stage,:initialize=>[:eleitor=>txt1.text.to_s,
               :cargos=>cargos,:encerra=>encerra,:main_stage=>stage])
         end

         #with(stage, title: "Hello World!", width: 800, height: 600) do
         #    UrnaController
        #    show
        # end
    end
end
end


Urna::Urna.launch
