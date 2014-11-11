require 'jrubyfx'
require 'active_record'

ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))['development'])
ActiveRecord::Base.logger = Logger.new(File.open(File.join('tmp','database.log'), 'a'))

require_relative "../app/controllers/urna"
require_relative "../app/models/cargo"

class Urna <  JRubyFX::Application

    def start(args)
         with(stage, title: "Hello World!", width: 800, height: 600) do
            fxml UrnaController
            show
         end
    end
end



Urna.launch
