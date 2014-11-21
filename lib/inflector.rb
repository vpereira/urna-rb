require 'active_support'
require 'active_support/inflections'

module Urna
    class Inflector
        def self.set_inflections
            ActiveSupport::Inflector.inflections(:en) do |inflect|
                inflect.irregular 'eleicao', 'eleicoes'
            end
        end
    end
end
