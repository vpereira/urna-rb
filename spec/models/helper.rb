require 'minitest'
require "minitest/autorun"
require 'active_record'
require_relative '../../lib/db'
require_relative "../../app/models/cargo"
require_relative "../../app/models/partido"
require_relative "../../app/models/candidato"
require_relative "../../app/models/eleicao"
require_relative "../../app/models/voto"

# TODO
# env should be variable
Urna::Db::init(:config=>'config/database.yml',:env=>'test')
