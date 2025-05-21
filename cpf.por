programa {
  inclua biblioteca Texto
  inclua biblioteca Tipos
  funcao inicio() {

    cadeia cpf, digitos = "", digito[14]
    inteiro tam, primeiro_verificado, cont = 0, contador = 3, soma = 0, resto, contadorI = 0, tam14 = 14, cpf_formatado[11], so_numeros[9], multipliocador = 10
    caracter cpf14[14], aux = ' ', cpf11[11]
    logico teste

    escreva("Digite seu CPF: ")
    leia(cpf)

    tam = Texto.numero_caracteres(cpf)

      se(tam == 11){
        teste = Tipos.cadeia_e_inteiro(cpf, 10)
        se(teste){
          para(inteiro i = 0; i < 11; i++){
            cpf11[i] = Texto.obter_caracter(cpf, i)
            }
            para(inteiro i = 0; i < 11; i++){
              cpf_formatado[i] = Tipos.caracter_para_inteiro(cpf11[i])
            }
        }
        senao{
          escreva("CPF inválido\n")
          retorne
        }
      }
      senao se(tam == 14){
        faca{
          para(inteiro i = contadorI; i < contador; i++){
            aux = Texto.obter_caracter(cpf, i)
            digitos += Tipos.caracter_para_cadeia(aux)
            }
          contador = contador + 4
          contadorI = contadorI + 4
          teste = Tipos.cadeia_e_inteiro(digitos, 10)
            se(teste){
              cont++
              se(cont == 3){
                para(inteiro i = 12; i < 14; i++){
                  aux = Texto.obter_caracter(cpf, i)
                  digitos += Tipos.caracter_para_cadeia(aux)
                  teste = Tipos.cadeia_e_inteiro(digitos, 10)
                  }
                  se(teste){
                    para(inteiro i = 0; i < 14; i++){
                      aux = Texto.obter_caracter(cpf, i)
                      digito[i] = Tipos.caracter_para_cadeia(aux)
                      }
                      se(digito[3] != "." ou digito[7] != "." ou digito[11] != "-"){
                        escreva("CPF inválido\n") 
                        retorne        
                        }
                      senao{
                        se(teste){
                          para(inteiro i = 0; i < 14; i++){
                          cpf14[i] = Texto.obter_caracter(cpf, i)
                          }
                          faca{
                            para(inteiro i = 0; i < 14 - 1; i++){
                              se((cpf14[i] >= '0' e cpf14[i] <= '9') == (cpf14[i+1] < '0' e cpf14[i+1] > '9')){
                                aux = cpf14[i]
                                cpf14[i] = cpf14[i+1]
                                cpf14[i+1] = aux
                                }
                              }
                            tam14--
                          }enquanto(tam14 >= 0)
                          para(inteiro i = 0; i < 11; i++){
                            cpf_formatado[i] = Tipos.caracter_para_inteiro(cpf14[i])
                            }
                          }                          
                        }
                  }
                  senao{
                    escreva("CPF inválido\n")
                    retorne            
                  }
                }
            }
            senao{
              escreva("CPF inválido\n")
              retorne    
            }
          }enquanto(cont < 3)
        }
      senao{
        escreva("CPF inválido\n")
        retorne
        }
        para(inteiro i = 0; i < 9; i++){
          so_numeros[i] = cpf_formatado[i]
        }
        para(inteiro i = 0; i < 9; i++){
          soma = soma + (so_numeros[i] * multipliocador)
          multipliocador--
        }
        resto = soma % 11
        se(resto < 2){
          primeiro_verificado = 0
        }
        senao{
          primeiro_verificado = 11 - resto
        }       
        escreva("\nO CPF digitado pelo usuário é: ",cpf)
        escreva("\nPrimeirop digito verificado pelo sistema é: ",primeiro_verificado)
        escreva("\nPrimeiro digito verificador digitado pelo usuário é: ",Texto.obter_caracter(cpf, 12))
        escreva("\nComparação do PDV encontrado com PDV digitado: ",primeiro_verificado == Texto.obter_caracter(cpf, 12),"\n")
  }
}

