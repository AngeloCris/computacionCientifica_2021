Semana 10
================

-   [1 Operadores y Estructuras de control
    (Sem 10)](#operadores-y-estructuras-de-control-sem-10)
    -   [1.1 for](#for)
        -   [1.1.1 Ejemplos](#ejemplos)
    -   [1.2 while](#while)
        -   [1.2.1 Ejemplos](#ejemplos-1)

# 1 Operadores y Estructuras de control (Sem 10)

## 1.1 for

La estructura *for* permite ejecutar bucles realizando una operación
para cada elemento de un conjunto de datos, es decir, hace un proceso de
iteración.

``` r
#la estructura es
#for (variable in vector) {
#  proceso
#}
```

Esta estructura le dice a R:

-   **PARA** cada elemento **EN** un objeto, realice un proceso
    específico.

Cuando observamos la estructura del bucle, la “variable” puede ser un
elemento cualquiera (la podemos llamar como nosotros queramos) pero el
objeto “vector” tiene que ser un objeto existente.

### 1.1.1 Ejemplos

-   Sumarle 2 unidades a cada elemento del objeto “vector” definido
    líneas abajo:

``` r
vector <- 5:10

vector[1] + 2
```

    ## [1] 7

``` r
vector[2] + 2 
```

    ## [1] 8

``` r
vector[3] + 2
```

    ## [1] 9

``` r
vector[4] + 2
```

    ## [1] 10

``` r
vector[5] + 2
```

    ## [1] 11

``` r
for (i in length(vector)) {
  vector1 <- vector[i] + 2

}

vector1
```

    ## [1] 12

-   Si deseamos imprimir vectores con la siguiente forma: “El año es x”,
    donde x es igual a 1990, 1991, 1992, … , 2020 y 2021. Esto se podría
    realizar de la siguiente manera:

``` r
print(paste("El año es", 1990))
```

    ## [1] "El año es 1990"

``` r
print(paste("El año es", 1991))
```

    ## [1] "El año es 1991"

``` r
print(paste("El año es", 1992))
```

    ## [1] "El año es 1992"

``` r
print(paste("El año es", 1993)) #asi sucesivamente
```

    ## [1] "El año es 1993"

``` r
print(paste("El año es", 2019))
```

    ## [1] "El año es 2019"

``` r
print(paste("El año es", 2020))
```

    ## [1] "El año es 2020"

``` r
print(paste("El año es", 2021))
```

    ## [1] "El año es 2021"

Cuando la longitud del vector x es grande, este proceso se vuelve
tedioso. En este caso se recomientda usar un loop en R para que el
proceso se repita continuamente.

``` r
for (year in 1990:2021) {
  print(paste("El año es", year))
}
```

-   Calcular el cuadrado de los 10 primeros elementos de un vector u1

``` r
#Vector u1
u1 <- rnorm(30)
print("Este loop calculará el cuadrado de los 10 primeros elementos del vector u1")
```

    ## [1] "Este loop calculará el cuadrado de los 10 primeros elementos del vector u1"

``` r
usq <- 0

for (i in 1:10) {
  usq[i] <- u1[i] * u1[i]
  print(usq[i])
}
```

    ## [1] 0.6341432
    ## [1] 2.443975
    ## [1] 1.043532
    ## [1] 0.8182331
    ## [1] 0.003327914
    ## [1] 0.8078869
    ## [1] 1.911062
    ## [1] 0.01207042
    ## [1] 0.8487465
    ## [1] 0.119045

## 1.2 while

Tipo de bucle que realizará un proceso **mientras** la condición
propuesta sea **verdadera**.

``` r
#while (condicion) {
#  operaciones
#}
```

### 1.2.1 Ejemplos

-   Imprimir el siguiente mensaje “Cuando el valor de inicio sea mayor o
    igual a 5, detener operación” donde la variable “límite” es igual a
    5 y la variable “inicio”, 0.

``` r
limite <- 5
inicio <- 0

while (inicio < limite) {
  print("Cuando el valor de inicio sea mayor o igual a 5, detener operación")
  inicio <- inicio + 1
}
```

    ## [1] "Cuando el valor de inicio sea mayor o igual a 5, detener operación"
    ## [1] "Cuando el valor de inicio sea mayor o igual a 5, detener operación"
    ## [1] "Cuando el valor de inicio sea mayor o igual a 5, detener operación"
    ## [1] "Cuando el valor de inicio sea mayor o igual a 5, detener operación"
    ## [1] "Cuando el valor de inicio sea mayor o igual a 5, detener operación"

Tener cuidado con crear bucles infinitos! Si se ejecuta el While con una
condición que nunca termine, este no se detendrá.

``` r
#while (inicio < limite) {
#  print("Cuando el valor de inicio sea mayor a 5, detener la operación")
#}
```

-   Realizar un proceso iteración (10 veces) donde se muestre el mensaje
    “Este es el loop número x”. Sea x el número de la iteración.

``` r
#Crear una variable con valor 1
inicio <- 1

#Create un loop
while (inicio <= 10) {
  cat("Este es el loop número", inicio)
  inicio <- inicio + 1
  print(inicio)
}
```

    ## Este es el loop número 1[1] 2
    ## Este es el loop número 2[1] 3
    ## Este es el loop número 3[1] 4
    ## Este es el loop número 4[1] 5
    ## Este es el loop número 5[1] 6
    ## Este es el loop número 6[1] 7
    ## Este es el loop número 7[1] 8
    ## Este es el loop número 8[1] 9
    ## Este es el loop número 9[1] 10
    ## Este es el loop número 10[1] 11

-   Deseamos conocer el primer número entero positivo cuyo cuadrado
    exceda a 4000:

``` r
#Variable de inicialización
n <- 0
potencia <- 0

#While loop
while (potencia <= 4000) {
  n <- n + 1 #definiendo número entero positivo
  potencia <- n ^ 2 #definiendo el cuadrado de ese número
}
```

-   Suma de dos vectores

``` r
x <- c(1, 2, 3, 4)
y <- c(0, 0, 5, 1)
n <- length(x)
i <- 0
z <- numeric(n)

while (i <= n) {
  z[i] <- x[i] + y[i]
  i <- i + 1
}

z
```

    ## [1] 1 2 8 5

-   Extraer un número al azar de una secuencia numérica del 1 al 10
    hasta que la suma de sus elementos extraídos sea menor a 50. Indicar
    el número de iteraciones y la suma resultante.

``` r
contador <- 0
suma <- 0

while (suma < 50) {
  suma <- suma + sample(x = 1:10, size = 1)
  contador <- contador + 1
}
```

En clase se vió un ejemplo en donde los elementos de un vector x
correspondían a conteos de animales avistados a lo largo de un
transecto. Solicitaban encontrar en punto a lo largo del transecto en
que el número acumulado de animales avistados es al menos 50

``` r
x <- c(1,0,1,2,1,4,7,2,6,1,8,2,0,3,0,10,8,5,4,5,8,2,0,5,8)
sum <- 0
i <- 0

while (sum > 50) {
  i = i + 1
  sum = sum + x[i]
  print(sum)
}
```
