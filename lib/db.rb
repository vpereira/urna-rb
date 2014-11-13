module Urna
class Db
    def self.init(params = {})
        ActiveRecord::Base.establish_connection(YAML::load(File.open(params[:config]))[params[:env]])
        ActiveRecord::Base.logger = Logger.new(File.open(File.join('tmp','database.log'), 'a'))
    end
end
end
