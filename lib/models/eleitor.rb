class Eleitor < ActiveRecord::Base
  attr_accessor :titulo_de_eleitor
  validates_uniqueness_of :assinatura
  # TODO
  # it should be handled by inflections
  self.table_name = "eleitores"

  belongs_to :eleicao, :foreign_key=>"numero_eleicao",:primary_key=>"numero"
  has_many :votos, :foreign_key=>"numero_eleitor", :primary_key=>"numero"

  before_save :cria_assinatura, :gera_posicao

  def initialize(opts = {})
    @titulo_de_eleitor = opts[:titulo_de_eleitor]
    @sha256_handle = OpenSSL::Digest::SHA256.new
    super(opts)
  end

  private

  # we insert the user in random order
  # TODO
  # improve it, its a prototype
  def gera_posicao
    r = 0
    i = nil
    while 1
      r = rand(2**30 - 1)
      next if r.zero?
      break unless Eleitor.exists?(r)
    end
    self.numero = r
  end

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
