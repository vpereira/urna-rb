require_relative 'helper'

describe Eleitor do
  before do
    # there isnt a way to do it per object?
    @eleitor = Eleitor.new
    def @eleitor.votos; Urna::Test::create_fake_votos; end
    @eleitor.titulo_de_eleitor = "1012121618"

  end
  it {
    @eleitor.votos.wont_be_empty
  }
end
