require "openssl"
require "base64"
require "bundler/setup"
Bundler.setup
require "active_record"
require 'jrubyfx'

# add it to the load path.
# im having problems with require_relative
# and java classpath
$:.unshift File.dirname(__FILE__)

require "lib/db"
require "lib/models/cargo"
require "lib/models/partido"
require "lib/models/candidato"
require "lib/models/eleicao"
require "lib/models/voto"
require "lib/models/eleitor"
