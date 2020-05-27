'''
K-medoids
-Agrupa os dados pelo ponto mais representativo
'''
install.packages("cluster", dependencies = T)
library(cluster)

cluster = pam(iris[1:4], k=3)
'''
Medoids:
      ID Sepal.Length Sepal.Width Petal.Length Petal.Width
[1,]   8          5.0         3.4          1.5         0.2
[2,]  79          6.0         2.9          4.5         1.5
[3,] 113          6.8         3.0          5.5         2.1
'''
plot(cluster)

#confusão
table(iris$Species,cluster$clustering)
'''
              1  2  3
  setosa     50  0  0
  versicolor  0 48  2
  virginica   0 14 36
'''