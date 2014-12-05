class Eleitor < ActiveRecord::Base
  attr_accessor :titulo_de_eleitor
  # TODO
  # it should be handled by inflections
  self.table_name = "eleitores"

  belongs_to :eleicao, :foreign_key=>"numero_eleicao",:primary_key=>"numero"
  has_many :votos, :foreign_key=>"numero_eleitor", :primary_key=>"numero"

  before_save :cria_assinatura

  def initialize(opts = {})
    @titulo_de_eleitor = opts[:titulo_de_eleitor]
    @sha256_handle = OpenSSL::Digest::SHA256.new
    super(opts)
  end

  private

  def cria_assinatura
    v = self.votos.collect { |c| c.numero_candidato }.join("|")
    # TODO
    # validate the idea
    # ^^^^^^^^^^^^^^^^^
    # we will need an other salt? the idea is that the eleitor will be able to
    # verify his vote, inserting his codigo de eleitor and candidates in the
    # right order
    # we should base64 it
    self.assinatura = Base64.encode64(@sha256_handle.digest(@sha256_handle.digest(
    @titulo_de_eleitor) + v))
  end
end
