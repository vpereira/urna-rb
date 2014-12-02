require_relative 'helper'

describe Cargo do
  before do
    @cargo = Cargo.first
  end
  it { @cargo.must_respond_to(:candidatos)}
  it { @cargo.must_respond_to(:eleicao)}
end
