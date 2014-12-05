class CreateEleitores < ActiveRecord::Migration
  def change
    create_table :eleitores, :id=>false  do |t|
      t.string  :assinatura
      t.integer :numero
      t.integer :numero_eleicao
      t.primary_key :numero
    end
  end
end
