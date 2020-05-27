'''
Regras de Associação
'''
install.packages("arules")
library(arules)

#Carregando a lista
transacoes <- read.transactions(file.choose(), format = "basket", sep = ",")
'''
transactions in sparse format with
 6 transactions (rows) and
 3 items (columns)'''
inspect(transacoes)
'''
items                  
[1] {Cerveja,Pizza,Sorvete}
[2] {Pizza,Sorvete}        
[3] {Cerveja,Pizza}        
[4] {Cerveja,Pizza,Sorvete}
[5] {Cerveja,Pizza}        
[6] {Pizza} '''
image(transacoes)

#Criando as regras (suporte e confiança)
regras <- apriori(transacoes, parameter = list(supp = 0.5, conf = 0.5))

#Verifica
inspect(regras)
'''
    lhs          rhs       support   confidence coverage  lift count
[4] {Sorvete} => {Pizza}   0.5000000 1.0000000  0.5000000 1    3    
[5] {Pizza}   => {Sorvete} 0.5000000 0.5000000  1.0000000 1    3    
[6] {Cerveja} => {Pizza}   0.6666667 1.0000000  0.6666667 1    4    
[7] {Pizza}   => {Cerveja} 0.6666667 0.6666667  1.0000000 1    4    
'''
plot(regras, method = "graph", control = list(type = "items"))

#Mineração das regras de associação
regras2 <- eclat(transacoes, parameter = list(supp = 0.1, maxlen = 15))
inspect(regras2)
'''
    items                   support   transIdenticalToItemsets count
[1] {Cerveja,Pizza,Sorvete} 0.3333333 2                        2    
[2] {Pizza,Sorvete}         0.5000000 3                        3    
[3] {Cerveja,Sorvete}       0.3333333 2                        2    
[4] {Cerveja,Pizza}         0.6666667 4                        4    
[5] {Pizza}                 1.0000000 6                        6    
[6] {Cerveja}               0.6666667 4                        4    
[7] {Sorvete}               0.5000000 3                        3 
'''


