require 'jrubyfx'
require_relative "../urna"
require_relative '../lib/db'

Urna::Db::init(:config=>'config/database.yml',:env=>'development')




require_relative "../app/controllers/urna"


module Urna
class Urna <  JRubyFX::Application
    def start(args)
         with(stage, title: "Hello World!", width: 800, height: 600) do
            fxml UrnaController
            show
         end
    end
end
end


Urna::Urna.launch
