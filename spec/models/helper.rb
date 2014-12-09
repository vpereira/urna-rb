require 'minitest'
require "minitest/autorun"
require_relative '../../urna'

Urna::Db::init(:config=>'config/database.yml',:env=>'test')
