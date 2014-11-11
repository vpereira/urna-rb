require_relative '../app/models/cargo'

[["PRESIDENTE",2],["GOVERNADOR",2],["SENADOR",3],["DEPUTADO",4]].each do |k|
    Cargo.create :nome=>k[0],:digitos=>k[1]
end
