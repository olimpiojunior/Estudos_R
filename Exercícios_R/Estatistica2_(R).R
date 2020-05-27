'''
Regressão Logistica
'''
eleicao = read.csv(file.choose(), sep = ';', header = T)
fix(eleicao)

plot(eleicao$DESPESAS, eleicao$SITUACAO)
summary(eleicao)

#Verificando a correlação
cor(eleicao$DESPESAS, eleicao$SITUACAO) #0.81

#Criando o modelo
modelo = glm(SITUACAO ~ DESPESAS, family = "binomial", data = eleicao)

summary(modelo)

#Plotando por qtd
plot(eleicao$DESPESAS ~ eleicao$SITUACAO, col = 'red', pch = 20)
points(eleicao$DESPESAS, modelo$fitted, pch = 4)


#Prever
prever_eleicao = read.csv(file.choose(), sep = ';', header = T)
prever_eleicao
fix(prever_eleicao)

#Criando uma coluna com a probabilidade de ser eleito
prever_eleicao$RESULT = predict(modelo, newdata = prever_eleicao, type = "response")
prever_eleicao

