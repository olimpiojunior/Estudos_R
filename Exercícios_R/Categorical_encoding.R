'''
Categorical Encoding
'''
#install.packages("mltools")
#install.packages("data.table")

library(mltools)
library(data.table)

#Transformando o tabela Titanic (builtin) em dataframe
tit = as.data.frame(Titanic)

#Transformando variáveis categóricas em númericas
labenc = data.matrix(tit[,1:3])

#Transformando em tabela com valores devididos
hotenco = one_hot(as.data.table(tit[,1:3]))
