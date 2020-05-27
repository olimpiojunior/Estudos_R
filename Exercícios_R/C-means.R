'''
Fuzzy c-means
-Alguns dados podem pertencer a mais de um grupo segundo uma probabilidade
'''
library(e1071)

cluster = cmeans(iris[,1:4], centers = 3)
'''
Cluster centers:
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1     6.774939    3.052361     5.646692   2.0535119
2     5.003966    3.414092     1.482811   0.2535442
3     5.888873    2.761048     4.363864   1.3972701
'''

#Matriz de confusão
confusao = table(iris[,5], cluster$cluster)
'''
              1  2  3
  setosa      0 50  0
  versicolor  3  0 47
  virginica  37  0 13
'''
