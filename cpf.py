def valida_cpf(numeros , cpf):

    i = 0
    multiplicador = 10
    soma = 0
    for i in range(9):
        soma = soma + (int(numeros[i]) * multiplicador)
        i += 1
        multiplicador -= 1
    resto = soma % 11
    if resto < 2:
        pdv = 0
    else:
        pdv = 11 - resto

    multiplicador = 11      
    soma = 0 
    for i in range(9):
        soma = soma + (int(numeros[i]) * multiplicador)
        i += 1
        multiplicador -= 1
    soma += pdv * 2 
    resto = soma % 11
    if resto < 2:
        sdv = 0
    else:
        sdv = 11 - resto
        
    print('CPF digitado :',cpf,'\nPDV encontrado :',pdv,'\nSDV envontrado :',sdv)
    print('PDV encontrado comparado com o PDV digitado :',pdv == int(numeros[9]))
    print('SDV encontrado comparado com o SDV digitado :',sdv == int(numeros[10]))
    if pdv == int(numeros[9]) and sdv == int(numeros[10]):
        print('CPF válido')
    else:
        print('CPF inválido')

def valida_entrada():

    cpf = input('Digite seu CPF: ')
    tam = len(cpf)
    cpf_so_numeros = ''
    numeros = []

    if tam == 11:
        try:
            numeros = list(cpf)
            valida_cpf(numeros, cpf)
        except ValueError:
            print(cpf,"é inválido")
    elif tam == 14:
        if cpf[3] == '.' and cpf[7] == '.' and cpf[11] == '-':
            i = 0
            for i in range(tam):
                if cpf[i] == '.' or cpf[i] == '-':
                    continue
                cpf_so_numeros += cpf[i]
            try:
                numeros = list(cpf_so_numeros)
                valida_cpf(numeros, cpf)
            except ValueError:
                print(cpf,"é inválido")
        else:
            print(cpf,'é inválido')
    else:
        print(cpf,'é inválido')

    return numeros


def main():

    valida_entrada()

if __name__ == '__main__':
    main()
}
