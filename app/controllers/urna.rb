require 'jrubyfx'
fxml_root File.join(File.dirname(__FILE__),"..","views")

class UrnaController
    include JRubyFX::Controller
    fxml "urna.fxml"

    def initialize
        # TODO
        # it will be dynamic added
        @cargo = Cargo.find(3)
        @cargo_label.text = @cargo.nome
        @input = 1 #first input
        @max_input = @cargo.digitos
        @min_input = 1
        if @cargo.digitos > 2
            (@cargo.digitos - 2+1).upto(@cargo.digitos+1).each do |i|
                t = text_field()
                t.set_on_key_typed do |evt|
                  # get all text_field values
                  puts self.instance_variables
                end
                t.setPrefWidth(30)
                t.setPrefHeight(30)
                instance_variable_set("@input_#{i}", t)
                @input_hbox.add t
            end
        end
    end

    def input_next
        puts "#{@input} - #{@max_input}"
        @input+=1 if @input < @max_input
        i = self.instance_variable_get("@input_#{@input}")
        i.send(:request_focus)
    end

    def input_back
        @input-=1 if @input > @min_input
        i = self.instance_variable_get("@input_#{@input}")
        i.send(:request_focus)
    end

    def input_back
        @input-=1 if @input > @min_input
    end

    def input_reset
        @input=1
    end
    
    def get_inserted_number
      puts @input
      puts @max_input
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
    end

    def input_reset
        @input=1
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
    end

    # define the buttons and map it to the input field
    0.upto(9).each do |num|
        define_method("click_#{num}") do
            i = self.instance_variable_get("@input_#{@input}")
            i.send(:text=,num.to_s)
            input_next
        end
    end
end
