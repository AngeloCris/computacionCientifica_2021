x <- matrix(1,5,5)
x

y <- matrix(2.5,5,5)
y

x*y #multiplicación elemento por elemento
x%*%y #multiplicación matricial


#Laboratorio Semana 4

rep(0, times = 10)
rep(c(1,2), times = 10)
rep(c(1,2), each = 10)

# Reproducir la siguiente figura
x <- 1:19
y <- c(1:10,9:1)
x
y
plot(x, 
     y,
     col ="red",
     type ="lines",
     xlim = c(0,20),
     xlab = "Eje x",
     ylab ="Eje y")



#Grafico escalera
x1 <- c(1, rep(2:10, each=2))     
y1 <- c(rep(1:9, each = 2),10)

length(x1)
length(y1)

plot(x1, y1,
     type="lines",
     col ="red",
     xlim=c(-5,15), 
     xlab = "x",
     ylab = "Eje y")

#grafico circunferencia
#Primera circunferencia

#radio
radio <- 10

#Ecuación en coordenadas polares
x <- a + cos(t)*radio
y <- b + sin(t)*radio

#origen cero
a <- 0 
b <- 0

#angulo
t <- seq(0, 2*pi, length.out = 100)

#gráfico
plot(x, y,
     xlim = c(-20, 20),
     ylim = c(-10, 10),
     col = "white")  
lines(x,y, lwd=3, col = "red")

#Segunda circunferencia

#radio 1, 3, 5, 10
#Origen cero
x1 <- cos(t)*1
y1 <- sin(t)*1

x2 <- cos(t)*3
y2 <- sin(t)*3

x3 <- cos(t)*5
y3 <- sin(t)*5

x4 <- cos(t)*10
y4 <- sin(t)*10

#origen (10,0)
x5 <- 10 + cos(t)*radio
y5 <- 0 + sin(t)*radio


plot(0, 0, asp = 1, type = "n",
     xlim = c(-20, 30), ylim = c(-10, 10),
     ann = F)

lines(x2,y2, col="blue")
lines(x1,y1, col="blue")
lines(x3,y3, col="blue")
lines(x4,y4, col="blue")
lines(x5,y5, col="red")

#Lectura de archivos
setwd("D:/Mirror/udec/ayudantía/ComputaciónCientífica2021/semana4")

datos <- read.table("dataSem_4_2021.txt", sep=",", header = T)
head(datos)
class(datos)
class(datos$Year)
class(datos$Island)
class(datos$Month)
class(datos$Sex)
class(datos$CL)

summary(datos)
str(datos)
head(datos)
tail(datos)
names(datos)

#crear una matriz
m1 <- matrix(0,nrow(datos), 3)
m1
head(datos)

m1[,1] <- datos$Year
m1[,2] <- datos$CL
m1[,3] <- datos$Month
class(m1)

#Indexa matrices en R
v1 <- datos$CL

m1
m1.2012 <- m1[, m1$1 %in% c(2012,2013)]

table(datos$Year)

head(datos)
m1

#TOdas las filas del mes 10
datos[datos$Month %in% c(10,11),]

#Fabrique la matriz
m2 <- matrix(rep(c(1,10,100), each = 3),3,3, byrow = TRUE) 
m3 <- matrix(1, 3, 3)

m2 + m3
m2 - m3 
m2 * m3
m3 * m2

#Operacion de arreglos matriciales
m2 %*% m3
dim(m2)
dim(m3)
m3 %*% m2



##SEMANA 5 DATA FRAMES
datos$CL
x <- matrix(rep(1:6, each=5), nrow = 5, ncol = 6)
x
apply(x, 1, sum) #suma por columnas
apply(x, 2, sum) #suma por filas
x.all <- cbind(x, apply(x, 1, sum))
x.all2 <- rbind(x, apply(x, 2, sum))


trunc(datos$CL)
