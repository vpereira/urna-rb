require_relative 'helper'

describe Candidato do
  before do
    @candidato = Candidato.first
  end
  it { @candidato.must_respond_to(:votos)}
  it { @candidato.must_respond_to(:cargo)}
  it { @candidato.must_respond_to(:partido)}

  it { @candidato.must_equal Candidato.procura(@candidato.partido, @candidato.cargo) }
end
