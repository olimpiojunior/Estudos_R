'''
Distribui��o de Poisson
'''
#accident mean of cars is 2. Qual a probabilidade de ocorrer 3 acidentes?
dpois(3, lambda = 2) #0.180447

#qual a probabilidade de ocorrerem 3 ou menos acidentes?
ppois(3, lambda = 2) #0.8571235

#qual a probabilidade de ocorrerem 3 ou mais?
ppois(3, lambda = 2, lower.tail = F)#0.1428765, ou
1 - ppois(3, lambda = 2) #0.1428765

'''
Teste de Qui quadrado
verifica se existe diferen�a significativa entre duas hip�teses
'''
novela <- matrix(c(19, 6, 43, 32), nrow = 2, byrow = T)
rownames(novela) <- c("masc", "fem")
colnames(novela) <- c("assiste", 'N�o-assiste')
fix(novela)

#Fazendo o teste de qui-quadrado
chisq.test(novela)
#p-value = 0.1535 � maior que o alpha de 0.05.
#por tanto n�o rejeita a hipotese nula

'''
An�lise de Variancia - Anova
Realizando teste de variancia significativa entre o tempo de cura
dos rem�dios A, B e C do dataset anova.
'''
tratamento = read.csv(file.choose(), sep = ';', header = T)
fix(tratamento)

#Boxplot
boxplot(tratamento$Horas ~ tratamento$Remedio)

#Teste com um fator
an = aov(Horas ~ Remedio, data = tratamento)
summary(an) #p-value = 0.592

#Teste com dois fatores
an1 = aov(Horas ~ Remedio * Sexo, data = tratamento)
summary(an1)

#Caso conclua que existe varia��o significativa, faz-se o teste de Tukey
tukey = TukeyHSD(an)
'''
$Remedio
      diff       lwr      upr     p adj
B-A -0.625 -3.080978 1.830978 0.7991405
C-A  0.375 -2.080978 2.830978 0.9218996
C-B  1.000 -1.455978 3.455978 0.5689472
'''

#plotando
plot(tukey)


'''
Outliers
'''

#Verificando boxplot de uma unica vari�vel
boxplot(iris$Sepal.Width)

#Verificando boxplot sem mostrar os outliers
boxplot(iris$Sepal.Width, outline = F)

#Verificando s� os outliers
boxplot.stats(iris$Sepal.Width)$out #4.4 4.1 4.2 2.0

#Instalando o pacote outliers
install.packages('outliers')

library(outliers)

#verificando outliers
outlier(iris$Sepal.Width) #4.4
outlier(iris$Sepal.Width, opposite = T) #2


