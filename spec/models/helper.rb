require 'minitest'
require "minitest/autorun"
require "mocha"
require_relative '../../urna'

Urna::Db::init(:config=>'config/database.yml',:env=>'test')

FakeVoto = Struct.new(:numero_candidato)

module Urna
  class Test
    class << self
      def create_fake_votos
        3.times.collect { FakeVoto.new(numero_candidato:rand(31337).to_s) }
      end
    end
  end
end
