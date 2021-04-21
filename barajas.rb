require_relative 'carta.rb'

# Crear la clase baraja en el archivo barajas.rb con el atributo cartas, el cual será un arreglo.
class Baraja

    #Crear la clase carta con los atributos numero y pinta. Agregar los getters y setters a ambos atributos. Crear el constructor de la clase carta que le permita recibir un número del 1 al 13 y la pinta que está indicada por una sola letra. Puede ser Corazón: 'C', Diamante: 'D', Espada: 'E' o Trébol: 'T'

    attr_accessor :cartas #arreglo
    def initialize(cartas = [])

        #Al crear una baraja (constructor) se deben generar todas las combinaciones de números y pinta y guardarse dentro del arreglo cartas.
        numeros = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        pintas = ['C','D','E','T']
        largo = cartas.count
        
        if cartas == []
            for i in numeros
                for j in pintas
                    cartas.push(Carta.new(i,j))
                end
            end
        else
            for i in numeros
                for j in pintas
                    cartas.push(Carta.new(i,j))
                end
            end
            
            largo.times do |i|
                cartas.delete_at(0)
            end
        end
        @cartas = cartas
    end

    #Crear el método barajar que debe desordenar el arreglo de cartas
    def barajar
        self.cartas.shuffle
    end

    #Crear el método sacar que permita retirar la primera carta de la baraja
    def retirarPrimeraCarta
        primera = self.cartas.pop
        print "La primera carta es: " + primera.numero.to_s + " de " + primera.pinta
    end

    #Crear el método repartir mano que devolverá un arreglo con las primeras 5 cartas de la baraja.
    def repartirMano
        arreglo = []
        5.times do 
            arreglo.push(self.cartas.pop)
        end
        arreglo
    end

end

# Baraja vacia
b1 = Baraja.new()
b1.barajar
b1.retirarPrimeraCarta
b1.repartirMano



#Baraja con cartas
pintas = ['C','D','E','T']

cartasAzar = [c1 = Carta.new(rand(1..13), pintas.sample(1).join),c2 = Carta.new(rand(1..13), pintas.sample(1).join),c3 = Carta.new(rand(1..13), pintas.sample(1).join),c4 = Carta.new(rand(1..13), pintas.sample(1).join),c5 = Carta.new(rand(1..13),pintas.sample(1).join)]

b2 = Baraja.new(cartasAzar)
