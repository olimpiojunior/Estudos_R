'''
S�ries Temporais
'''
#Conjunto de dados airPassengers
AirPassengers
start(AirPassengers)
end((AirPassengers))

#plotando
plot(AirPassengers)

#Suavilizando a curva
plot(aggregate(AirPassengers))

#Verificando por mes
monthplot(AirPassengers)

#Plotando por partes
subst = window(AirPassengers, start = c(1950, 1), end = c(1950, 12))
subst
plot(subst)

#Decompondo (Sasonal, tendencia, aleatoriedade) 
dec = decompose(AirPassengers)
dec
plot(dec$seasonal)
plot(dec$trend)
plot(dec$random)
plot(dec$figure)
plot(dec)

#--------------------------------------------------------------------------------
#Previs�o
AirPassengers

#media total
mean(AirPassengers)

#media do ultimo ano
mean(window(AirPassengers, start <- c(1960, 1), end <- c(1960, 12)))

#instalando o pacote forecast para fazer previs�es
install.packages("forecast")
library(forecast)

#media m�vel
mediamovel <- ma(AirPassengers, order = 12)

#previs�o
previsao <- forecast(mediamovel, h=12)
plot(previsao)
arima = auto.arima(AirPassengers)
arima

previsao = forecast(arima, h=12)
plot(previsao)
#-------------------------------------------------------------------------------




