'''
Estatistica
'''

#Atribuindo valores
jogadores <- c(40000, 40000, 30000, 18000, 12000, 300000, 800000, 250000, 140000)

#media
mean(jogadores)

#mediana
median(jogadores)

#quartis
quartis <- quantile(jogadores)
quartis
 
quartis[3]

quartis[2]

#desvio padrão
sd(jogadores)

#informações estatistica
summary(jogadores)

'''
Distribuição Binomial
'''
#Encontrando a prababilidade
dbinom(3,5,0.5)

#4 sinais de 4 tempos, prob = 0,1,2,3,4
dbinom(0, 4, 0.25)
dbinom(1, 4, 0.25)
dbinom(2, 4, 0.25)
dbinom(3, 4, 0.25)
dbinom(4, 4, 0.25)

#Calculando a probabilidade cumulativa
pbinom(4,4,0.25)

#Prova 12 questões, qual a probabilidade de acertar 7 com 4 alternativas?
#Não estudou nada pra prova
dbinom(7, 12, 0.25)


'''
Operação com Distribuição Normal
'''
#Qual a probabilidade de escolher um objeto em uma cesta menor que 6kg
#obs: media = 8, dp = 2, objeto <6
pnorm(6,8,2)


pnorm(1500, 1250, 480)

#E se tiver mais de 6kg
pnorm(6,8,2, lower.tail = F) #ou
1 - pnorm(6,8,2)

#Qual a chance de menos de 6 e mais de 10kg
a = pnorm(6,8,2)
b = 1 - pnorm(10,8,2)
a + b

#E se tiver menos de 10 e mais de 8kg
pnorm(10,8,2) - pnorm(8,8,2, lower.tail = F)


#Teste de Shapiro-Wilk


x = rnorm(100) #Gera 100 valores aleatórios
qqnorm(x) #Gera o grafico de distribuição normal
qqline(x) #Gera a linha para comparação
shapiro.test(x) #Gera o valor p-value

#p-value <= 0.005 - "Não normal"
#p-value > 0.05 - "Normal"

'''
Distribuição T de Student
(amostras <= 30, Não se conhece o dp da população)
'''
#Uma pesquisa mostra que cientista de dados ganham R$75,00 por hora. Uma amostra
#de 9 cientista é selecionada. O desvio padrão da amostra é 10. Qual a
#probabilidade do salário ser menor que R$80,00? (pela tabela sabe que t=1.5)
pt(1.5, 8) #0.91

#Qual a probabilidade do salário ser menor que R$80?
pt(1.5, 8, lower.tail = F) #0.086

#ou
1 - pt(1.5, 8)

pt(1.5, 8) + pt(1.5, 8, lower.tail = F) #1

'''
Regressão Liner simples
'''
#cars é um dataset builtin do R. Possui velocidade e distancia
dim(cars)
head(cars)

#verificando correlação
cor(cars)

#Criando um modelo de linearização com a função lm
modelo = lm(speed ~ dist, data = cars)

#plot
plot(modelo)
plot(speed ~ dist, data = cars)
abline(modelo)

#Encontrando coeficientes. Retorna Interseção e distancia
modelo$coefficients

#Calculando a velocidade na dist = 67
modelo$coefficients[1] + modelo$coefficients[2] * 67 # = 19.37693

#Realizando previsão com a função predict()
predict(modelo, data.frame(dist = 67)) # = 19.37693

summary(modelo)

#Verificando os valores residuais
plot(modelo$residuals)

#Verificando correlação de valores ajustados com distancia
plot(modelo$fitted.values, cars$dist)
#O grafico acima mostra os dados que o modelo criou pra criar a linha

'''
Criando modelo de regressão linear multipla
'''
colnames(mtcars) #Dataset builtin do R
dim(mtcars) #32 rows and 11 columns

#checando correlação entre mpg (consumo) e disp
cor(mtcars[1:4]) # -0.84

#criando modelo, x = disp - y = mpg
modelo = lm(mpg ~ disp, data = mtcars)
modelo

#Coeficiente de determinação (R²)
summary(modelo)$r.squared

#plotando
plot(mpg ~ disp, data = mtcars)
abline(modelo)

#fazendo as previsões para disp (polegadas cúbicas)
predict(modelo, data.frame(disp = 200))

#Agora fazendo o modelo com mais de uma variável explanatoria
modelo2 = lm(mpg ~ disp + hp + cyl, data = mtcars)

#R² e R² ajustado
summary(modelo2)$r.squared
summary(modelo2)$adj.r.squared

#Fazendo previsão com as novas variáveis
predict(modelo2, data.frame(disp = 200, hp = 100, cyl = 4))
