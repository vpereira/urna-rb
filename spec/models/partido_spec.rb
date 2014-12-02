require_relative 'helper'

describe Partido do
  # yup i touch the db and im not burning in hell!
  #subject { Partido.first }
  it { Partido.first.must_respond_to(:candidatos) }
  # we have to test the foreign keys and etc.. check minitest-rails-shoulda
end
