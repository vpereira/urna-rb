require 'openssl'
require "base64"
require 'bundler/setup'
Bundler.setup
require 'active_record'
require_relative './lib/db'
require_relative "./app/models/cargo"
require_relative "./app/models/partido"
require_relative "./app/models/candidato"
require_relative "./app/models/eleicao"
require_relative "./app/models/voto"
require_relative "./app/models/eleitor"
