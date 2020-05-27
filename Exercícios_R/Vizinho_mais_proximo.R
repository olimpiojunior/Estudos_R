'''
Vizinho mais proximo e floresta
'''
#Aprendizado baseado em instancias (classificação)
install.packages("class", dependencies = T)
library(class)

amostra <- sample(2, 150, replace = T, prob = c(0.7, 0.3))

dadostreino <- iris[amostra == 1,]
classificar <- iris[amostra == 2,]

#Realizando a previsão de vizinhos mais proximos
previsao <- knn(dadostreino[,1:4], classificar[,1:4], dadostreino[,5], k=3)

#Matriz de confusão
confusao <- table(classificar[,5], previsao)

#Usando Ensamble Learning
install.packages("ramdomForest", dependencies = T)
library(randomForest)

credito <- read.csv(file.choose(), sep = ',', header = T)

#Dividindo o dataset em treino e teste
amostra <- sample(2, 1000, replace = T, prob <- c(0.7, 0.3))

#Criando as amostras
dadostreino <- credito[amostra == 1,]
dadosteste <- credito[amostra == 2,]

floresta <- randomForest(as.factor(class) ~ ., data = dadostreino, ntree = 100,
                         importance = T)

#Verificando graficamente a importancia dos atributos
varImpPlot(floresta)

previsao <- predict(floresta, dadosteste) #Previsão
confusao1 <- table(previsao, dadosteste$class) #Tabela
'''
previsao bad good
    bad   35   24
    good  62  189
'''

#taxas
taxacerto <- (confusao1[1] + confusao1[4]) / sum(confusao1) #7225%
taxaerro <- (confusao1[2] + confusao1[3]) / sum(confusao1) #2774%

