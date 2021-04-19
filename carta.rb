class Carta

    # numero (1 al 13) y pinta ( C, D, E, T)
    attr_accessor :numero, :pinta #GETTERS

    def initialize(numero, pinta)

        pinta.upcase!
        pintas = ['C','D','E','T']


        if (numero >= 1 && numero <= 13) && pintas.include?(pinta)
            @numero = numero
            @pinta = pinta
        else
            raise ArgumentError.new("El numero no está en el rango o la pinta no es valida")

        end
    end
end