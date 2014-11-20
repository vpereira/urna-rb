class Cargo < ActiveRecord::Base
    has_many :candidatos,:foreign_key=>"numero_cargo",:primary_key=>"numero"
end
