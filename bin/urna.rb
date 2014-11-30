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

         btn1.set_on_action  do |e|
           #txt1.text.to_s
           UrnaController.load_into(stage,:initialize=>[:eleitor=>txt1.text.to_s])
         end

         pane = vbox 10
         pane.add lbl1
         pane.add txt1
         pane.add btn1
         pane.set_alignment(Pos::CENTER)
         scene1 = scene(pane,250,150)
         stage.scene = scene1
         stage.title = "Urna Eletronica - Brasileira"
         stage.show


         #with(stage, title: "Hello World!", width: 800, height: 600) do
         #    UrnaController
        #    show
        # end
    end
end
end


Urna::Urna.launch
