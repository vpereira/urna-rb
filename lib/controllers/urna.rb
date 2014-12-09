require 'jrubyfx'
require_relative 'fim'

fxml_root File.join(File.dirname(__FILE__),"..","views"), File.expand_path(File.join("lib","views"))

class UrnaController

    include JRubyFX::Controller
    fxml "urna.fxml"
    NUMERO_MINIMO_DIGITOS = 2 # o numero minimo para um cargo sao 2 digitos.

    def initialize(*args)
        if args
          # improve it, error handling and validation
          @eleitor = args.first[:eleitor]
          @cargos = args.first[:cargos]
          @encerra = args.first[:encerra]
          @main_stage = args.first[:main_stage]
          @cargo = @cargos.pop unless @cargos.empty?
        end

        @cargo_label.text = @cargo.nome
        @input = 1 #first input
        @max_input = @cargo.digitos
        @min_input = 1
        @candidato = nil

        # confirma inicializado desabilitado
        @confirma.set_disable(true)

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

    on :click_confirma do |arg|
      if @candidato
        @candidato.votos.create(:eleitor=>@eleitor)
        source = arg.get_source
        stage = source.get_scene.get_window

        som_confirma = audio_clip File.expand_path(File.join("file://",__FILE__,"..","..","..","sounds",
        "botoes.wav"))
        som_fim =  audio_clip File.expand_path(File.join("file://",__FILE__,"..","..","..","sounds",
        "fim.wav"))


        # no more cargos to be voted? So thats it!
        if @cargos.empty?
          som_fim.play
          @eleitor.save
          FimController.load_into(stage)
        else
          som_confirma.play
          UrnaController.load_into(stage,:initialize=>[:eleitor=>@eleitor,
            :cargos=>@cargos])
        end
      end
    end


    # define the buttons and map it to the input fields
    0.upto(9).each do |num|
        define_method("click_#{num}") do
            i = self.instance_variable_get("@input_#{@input}")
            i.send(:text=,num.to_s)
            input = self.instance_variable_get("@input")
            # if all inputs were inserted, query the db and show the results
            # TODO:
            # - what to do if no record was found
            if input == @cargo.digitos
              @candidato = procura_candidato
              popula_nome_foto_e_partido # TODO: we dont need it as param
              @confirma.set_disable(false)
            end
            input_next
        end
    end

    protected

    def procura_candidato
      Candidato.procura get_inserted_number, @cargo.numero
    end

    def popula_nome_foto_e_partido
      @nome_candidato.text =  @candidato.nome
      @nome_partido.text = @candidato.partido.nome
      @foto.set_image(image(@candidato.photo))
    end

    def remove_nome_foto_e_partido
      @nome_candidato.text = ""
      @nome_partido.text = ""
      @foto.set_image(nil)
      @candidato = nil
    end
end
