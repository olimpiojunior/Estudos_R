'''
Machine Learning
'''
#instalando o pacote de machine learning e1071
install.packages("e1071", dependencies = T)
library(e1071)

#abrindo o dataset credito
credito <- read.csv(file.choose(), sep = ',', header = T)

#Dividindo o dataset em treino e teste
amostra <- sample(2, 1000, replace = T, prob <- c(0.7, 0.3))

#Criando as amostras
dadostreino <- credito[amostra == 1,]
dadosteste <- credito[amostra == 2,]

#criando o modelo
modelo <- naiveBayes(as.factor(class) ~ ., dadostreino)

#testando o medelo
predicao = predict(modelo, dadosteste)

#Avaliando a predicao
confusao <- table(dadosteste$class, predicao)

#calculando a taxa de acerto
taxacerto = (confusao[1] + confusao[4]) / sum(confusao) #74%

#calculando a taxa de erro
taxaerro = (confusao[2] + confusao[3]) / sum(confusao) #26%

#Verificando os dados de um novo cliente
novocredito <- read.csv(file.choose(), sep = ',', header = T)
predicaonovo <- predict(modelo, novocredito) #good

#medelo de classificação usando arvore de decisão
install.packages("rpart", dependencies = T)
library(rpart)

#rpart pode pode ser usado tanto para classif. qnt para regressão
arvore <- rpart(class ~ ., data = dadostreino, method = "class" )

#printando e plotando a arvore
print(arvore)
plot(arvore)
text(arvore, use.n = T, cex = .8)

#Realizando uma previsão (retorna prob de ser good or bad)
teste <- predict(arvore, dadosteste)

#binarizando para melhorar a analise
cred <- cbind(dadosteste, teste) #add cols teste
fix(cred)

#Criando a coluna com resultado (good or bad)
cred["Result"] <- ifelse(cred$bad >= 0.5, "bad", "good")
fix(cred)

#comparando os resultados
cred["Compare"] <- ifelse(cred$class == cred$Result, "CERTO", "ERRADO")

#Criando a matrix de confusão
confusao <- table(cred$class, cred$Result)

#calculando a taxa de acerto
taxacerto2 = (confusao[1] + confusao[4]) / sum(confusao) #71%

#calculando a taxa de erro
taxaerro2 = (confusao[2] + confusao[3]) / sum(confusao) #29%

#Usando máquina de suporte
modelo2 <- svm(as.factor(class) ~ ., dadostreino)

#Fazendo a predição
predicao2 <- predict(modelo2, dadosteste)

#Matrix de confusão
confusao2 <- table(dadosteste$class, predicao2)

#Taxa de acerto e erro
taxacerto3 <- (confusao2[1] + confusao2[4]) / sum(confusao2) #70%
taxaerro3 <- (confusao2[2] + confusao2[3]) / sum(confusao2) #30%

#Fazendo uma seleção de atributos para realizar a predição
#Existem pacotes para fazer essa seleção:
install.packages("FSelector", dependencies = T)
library(FSelector)

#gerando a seleção de atributos mais importantes para a predição
random.forest.importance(class ~ ., credito)

#Recriando o modelo, agora com menos atrbutos
modelo3 <- svm(as.factor(class) ~ checking_status + duration +
                 credit_history + purpose + credit_amount +
                 savings_status, dadostreino)

predicao3 <- predict(modelo3, dadosteste)
confusao3 <- table(dadosteste$class, predicao3)

taxacerto4 <- (confusao3[1] + confusao3[4]) / sum(confusao3) #70%
taxaerro4 <- (confusao3[2] + confusao3[3]) / sum(confusao3) #30%
#Não houve diferença relevante



