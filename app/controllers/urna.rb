require 'jrubyfx'
fxml_root File.join(File.dirname(__FILE__),"..","views")

class UrnaController
    include JRubyFX::Controller
    fxml "urna.fxml"
    NUMERO_MINIMO_DIGITOS = 2 # o numero minimo para um cargo sao 2 digitos.
    def initialize
        # TODO
        # it will be dynamic added
        @cargo = Cargo.find_by(nome:"PRESIDENTE")
        @cargo_label.text = @cargo.nome
        @input = 1 #first input
        @max_input = @cargo.digitos
        @min_input = 1
        if @cargo.digitos > NUMERO_MINIMO_DIGITOS
          (NUMERO_MINIMO_DIGITOS+1).upto(@cargo.digitos).each do |i|
                t = text_field
                t.setPrefWidth(30)
                t.setPrefHeight(30)
                instance_variable_set("@input_#{i}", t)
                @input_hbox.add t
            end
        end
    end

    def input_next
        @input+=1 if @input < @max_input
        i = self.instance_variable_get("@input_#{@input}")
        i.send(:request_focus)
    end

    def input_back
        @input-=1 if @input > @min_input
        i = self.instance_variable_get("@input_#{@input}")
        i.send(:request_focus)
    end


    def input_reset
        @input=1
    end

    #
    # get the text_field values and transform it to int.
    # then search in the database for this record
    #
    def get_inserted_number
      #@input_3
      #@input_2
      #@input_1
      num = self.instance_variables.grep(/^@input_[0-9]/).collect do |i|
        text_f = self.instance_variable_get(i)
        text_f.text
      end
      num.reverse.join.to_i
    end

    # TODO
    # change to the syntax
    # on :click_corrige do
    # ...
    # end
    def click_corrige
        i = self.instance_variable_get("@input_#{@input}")
        i.send(:text=,"")
        input_back
        remove_nome_foto_e_partido
    end

    # define the buttons and map it to the input field
    0.upto(9).each do |num|
        define_method("click_#{num}") do
            i = self.instance_variable_get("@input_#{@input}")
            i.send(:text=,num.to_s)
            input = self.instance_variable_get("@input")
            # if all inputs were inserted, query the db and show the results
            # TODO:
            # - what to do if no record was found
            if input == @cargo.digitos
              c = procura_candidato
              popula_nome_foto_e_partido(c)
            end
            input_next
        end
    end

    protected

    def procura_candidato
      Candidato.where("numero = ? AND numero_cargo = ?", get_inserted_number, @cargo.numero).first
    end

    def popula_nome_foto_e_partido(candidato)
      @nome_candidato.text =  candidato.nome
      @nome_partido.text = candidato.partido.nome
      @foto.set_image(image(candidato.photo))
    end

    def remove_nome_foto_e_partido
      @nome_candidato.text = ""
      @nome_partido.text = ""
      @foto.set_image(nil)
    end
end
