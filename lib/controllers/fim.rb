require 'jrubyfx'
fxml_root File.expand_path(File.join(File.dirname(__FILE__),"..","views"))

class FimController
  include JRubyFX::Controller
  fxml "fim.fxml"
end
