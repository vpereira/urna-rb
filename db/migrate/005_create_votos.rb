class CreateVotos < ActiveRecord::Migration
  def change
    create_table :votos, :id=>false  do |t|
      t.integer :numero
      t.integer :numero_candidato
      t.primary_key :numero
    end
  end
end
