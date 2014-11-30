# encoding: utf-8
#
require_relative '../app/models/cargo'
require_relative '../app/models/partido'
require_relative '../app/models/candidato'
require_relative '../app/models/eleicao'

[["PRESIDENTE",2],["GOVERNADOR",2],["SENADOR",3],["DEPUTADO FEDERAL",4],["DEPUTADO FEDERAL",4],["VEREADOR",5],["PREFEITO",2]].each do |k|
    Cargo.create :nome=>k[0],:digitos=>k[1]
end

[
    [13, "Partido dos Trabalhadores", "PT"],
    [15, "Partido do Movimento Democrático Brasileiro", "PMDB"],
    [43, "Partido Verde", "PV"],
    [45, "Partido da Social Democracia Brasileira", "PSDB"],
    [50, "Partido Socialismo e Liberdade", "PSOL"],
    [65, "Partido Comunista do Brasil", "PCdoB"],
    [70, "Partido Trabalhista do Brasil", "PTdoB"]
].each do |k|

    Partido.create :numero=>k[0],:nome=>k[1],:sigla=>k[2]

end


Candidato.create :nome=>"DILMA VANA ROUSSEFF", :partido=>Partido.find_by(sigla:"PT"), :cargo=>Cargo.find_by(nome:"PRESIDENTE"), :numero_partido=>Partido.find_by(sigla:"PT").numero, :caminho_photo=>"Dilma.jpg"
Candidato.create :nome=>"AECIO NEVES", :partido=>Partido.find_by(sigla:"PSDB"), :cargo=>Cargo.find_by(nome:"PRESIDENTE"), :numero_partido=>Partido.find_by(sigla:"PSDB").numero, :caminho_photo=>"Aecio_Neves.jpg"


Candidato.create :nome=>"ALEXANDRE PADILHA", :partido=>Partido.find_by(sigla:"PT"), :cargo=>Cargo.find_by(nome:"GOVERNADOR"), :numero_partido=>Partido.find_by(sigla:"PT").numero, :caminho_photo=>"Alexandre_Padilha.jpg"
Candidato.create :nome=>"GERALDO ALCKIMIN", :partido=>Partido.find_by(sigla:"PSDB"),  :cargo=>Cargo.find_by(nome:"GOVERNADOR"), :numero_partido=>Partido.find_by(sigla:"PSDB").numero, :caminho_photo=>"Geraldo_Alckimin.jpg"

Eleicao.create :cargos=>[Cargo.find_by(nome:"PRESIDENTE"),Cargo.find_by(nome:"GOVERNADOR")]
