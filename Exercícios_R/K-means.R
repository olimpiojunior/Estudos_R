'''
K-means
-Agrupa dados baseando em um centroide
'''

#Criando 3 agrupamentos (38, 62, 50)
cluster = kmeans(iris[1:4], center = 3)

#Comparando o agrupamento com o real
table(iris$Species, cluster$cluster)
'''
              1  2  3
  setosa      0  0 50
  versicolor  2 48  0
  virginica  36 14  0
'''
#plotando
plot(iris[1:4], col = cluster$cluster)
