#1. Crear las clases Usuario y CuentaBancaria

class Usuario

    #Crear el constructor de Usuario que reciba el nombre del usuario y un arreglo con al menos 1 cuenta bancaria.
    attr_reader :cuenta_bancaria
    def initialize(nombre_usuario, cuenta_bancaria)
        if  cuenta_bancaria.class == Array && cuenta_bancaria.count >= 1
            @nombre_usuario = nombre_usuario
            @cuenta_bancaria = cuenta_bancaria
        else
            raise ArgumentError.new("Hay un problema con el dato de la cuenta bancaria")
        end
    end

    #Crear el método saldo total que devuelva la suma de todos los saldos del usuario.
    def saldoTotal
        cuentas_bancarias = self.cuenta_bancaria
        largo = cuentas_bancarias.count
        i = 0
        suma = 0
        while i < largo
            suma = suma + cuentas_bancarias[i].saldo
            i = i + 1
        end
        suma
    end

end

class CuentaBancaria
    
    #Crear el constructor de la clase CuentaBancaria que reciba el nombre del banco, el número de cuenta y el saldo (el saldo por defecto será cero).

    attr_writer :nombre_banco, :numero_cuenta
    attr_accessor :saldo

    def initialize(nombre_banco, numero_cuenta, saldo = 0)
        @nombre_banco = nombre_banco
        @numero_cuenta = numero_cuenta
        @saldo = saldo
    end

    #Crear el método transferir en la clase Cuenta que reciba un monto y otra cuenta. Este método restará del saldo actual el monto y aumentará el saldo de la otra cuenta en el mismo monto. Probar creando dos cuentas cada una con un saldo de 5000 y transferir el total de una cuenta a la otra.

    def transferir(monto,otra_cuenta)
        self.saldo = self.saldo - monto
        otra_cuenta.saldo = otra_cuenta.saldo + monto
    end
end


c1 = CuentaBancaria.new('BCI',97482986,500000)
c2 = CuentaBancaria.new('Itau',97480576,700000)
u1 = Usuario.new('Cratulas',[c1,c2])
print u1.saldoTotal


c3 = CuentaBancaria.new('BCI',97482986,5000)
c4 = CuentaBancaria.new('Itau',97480576,5000)
c3.transferir(5000,c4)