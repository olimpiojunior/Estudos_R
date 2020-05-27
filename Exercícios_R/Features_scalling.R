'''
Features Scalling
'''
boxplot(iris[.1:4])

#padronizando os valores
iris_padr = scale(iris[,1:4])
boxplot(iris_padr)

#Normalizando os valores (0 à 1)
normaliza = function(x){
  return((x-min(x))/(max(x)-min(x)))
}

iris_norm = normaliza(iris[,1:4])
boxplot(iris_norm)

