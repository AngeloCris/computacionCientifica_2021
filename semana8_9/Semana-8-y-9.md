Semana 8 y 9
================

-   [1 Operadores y Estructuras de control (Sem 8
    y 9)](#operadores-y-estructuras-de-control-sem-8-y-9)
    -   [1.1 if, else](#if-else)
        -   [1.1.1 Usando if y else](#usando-if-y-else)
    -   [1.2 If else](#if-else-1)

# 1 Operadores y Estructuras de control (Sem 8 y 9)

Nos permite controlar la manera en cómo se ejecuta nuestro código. Las
estructuras de control más usadas en R son las siguiente:

Las estructuras de control establecen **condicionales** en nuestros
códigos.

``` r
knitr::include_graphics("imagenes/estructuraControl.PNG")
```

<img src="imagenes/estructuraControl.PNG" width="80%" style="display: block; margin: auto;" />

## 1.1 if, else

*if* se usa cuando deseamos que una operación se ejecute cuando cumple
una condición deseada (Ej. **Si** esta condición es cierta, **entonces**
haz una operación específica)

*else* se usa para indicarle a R qué hace en caso de que la condición de
un *if* no se cumpla.

La estructura de un la función *if* es la siguiente

``` r
#if (condicion) {
#  proceso_si_se_cumple_condicion
#}
```

Si la condición es verdadera, entonces se realiza la operación. En caso
contrario, no se realiza la operación. Veamos algunos ejemplos:

``` r
#Se cumple la condición y se muestra "verdadero".
if (19 > 15) {
  "verdadero"
}
```

    ## [1] "verdadero"

``` r
#Si no se cumple la condición, el código no se ejecuta.
if (10 > 15) {
  "verdadero"
}
```

la función *else* complementa a *if*, es decir, le asigna un proceso
siempre en cuando la condición inicial no se cumpla. En otras palabras,
un *if* con *else* es la manera de decirle a R:

-   **SI** esta condición es cierta, **ENTONCES** haz estas
    operaciones.**DE OTRO MODO** haz estas otras operaciones

La estructura de in **if** con **else** es el siguiente:

``` r
#if (condition) {
#  proceso1
#} else {
#  proceso2
#}
```

Del ejemplo anterior podemos hacer las siguientes modificaciones:

``` r
#Se cumple condición
if (18 > 15) {
  "Verdadero"
} else {
  "Falso"
}
```

    ## [1] "Verdadero"

``` r
#No se cumple condición
if (10 > 15) {
  "Verdadero"
} else {
  "Falso"
}
```

    ## [1] "Falso"

### 1.1.1 Usando if y else

Para ilustrar el uso de *if* y *else* definiremos una función que
calcule el promedio de calificaciones de un estudiante y, dependiendo de
la calificación calculada, nos devuelva un mensaje específico.

``` r
promedio <- 
  function(calificacion){
    mean(calificacion)
  }

promedio(c(5,8,9,6,5))
```

    ## [1] 6.6

Ahora realizaremos un proceso de tal forma que la función nos muestre si
un estudiante ha aprobado o no. Si asumimos que un estudiante necesita
obtener 5 o más en promedio par aprobar podemos decir:

-   **SI** el promedio de un estudiante es igual o mayor a 5,
    **ENTONCES** mostrar “Aprobado”, **DE OTRO MODO**, mostrar
    "Reprobado.

``` r
promedio <- 
  function(calificaciones) {
    media <- mean(calificaciones)
    
    if (media >= 5) {
      print("Aprobado")
    } else{
      print("Desaprobado")
    }
  }
```

``` r
promedio(c(6,4,5,7,5,6))
```

    ## [1] "Aprobado"

``` r
promedio(c(3,4,4,4,5,3))
```

    ## [1] "Desaprobado"

## 1.2 If else

La función *ifelse()* permite vectoriza if, else. En lugar de escribir
una línea de código para cada comparación, podemos usar una sola llamada
a esta función, que se aplicará a todos los elementos de un vector.

Si intentamos usar if else con un vector, se nos mostrará una
advertencia:

``` r
if (1:10 < 3) {
  "Verdadero"
}
```

    ## [1] "Verdadero"

El mensaje muestra que la condición sólo es evaluada para el primer
elemento del vector 1:10, es decir para 1. Los demás elementos son
ignorados.

Por el contrario, con *ifelse* le indicamos que la condición debe de
cumplirse para cada uno de los elementos del vector. Esta función tiene
tres argumentos:

-   un vector

-   caracter que indique que mostrar si la condición se cumple

-   caracter que indique que mostrar si la condición se cumple

``` r
vector <- 1:10
ifelse(vector > 5, "valor_si_TRUE", "valor_si_FALSE")
```

    ##  [1] "valor_si_FALSE" "valor_si_FALSE" "valor_si_FALSE" "valor_si_FALSE"
    ##  [5] "valor_si_FALSE" "valor_si_TRUE"  "valor_si_TRUE"  "valor_si_TRUE" 
    ##  [9] "valor_si_TRUE"  "valor_si_TRUE"

``` r
edad <- c(10,15,17,19, 20, 13, 11, 16, 15)

ifelse(edad >= 15, "TRUE", "FALSE")
```

    ## [1] "FALSE" "TRUE"  "TRUE"  "TRUE"  "TRUE"  "FALSE" "FALSE" "TRUE"  "TRUE"

``` r
#Determinar cual de los números del 1 al 60 son pares y cuales impares ¿que se debe cumpli?

numeros <- 1:60
ifelse(numeros %% 2 == 0, "par", "impar")
```

    ##  [1] "impar" "par"   "impar" "par"   "impar" "par"   "impar" "par"   "impar"
    ## [10] "par"   "impar" "par"   "impar" "par"   "impar" "par"   "impar" "par"  
    ## [19] "impar" "par"   "impar" "par"   "impar" "par"   "impar" "par"   "impar"
    ## [28] "par"   "impar" "par"   "impar" "par"   "impar" "par"   "impar" "par"  
    ## [37] "impar" "par"   "impar" "par"   "impar" "par"   "impar" "par"   "impar"
    ## [46] "par"   "impar" "par"   "impar" "par"   "impar" "par"   "impar" "par"  
    ## [55] "impar" "par"   "impar" "par"   "impar" "par"

Otro ejemplo más complejo. Solicitamos sólo los números que son
exactamente divisibles entre 2 y 3.

``` r
numeros <- 1:20

ifelse(numeros %% 2 == 0 & numeros %% 3 == 0,
       "Divisible",
       "No divisible")
```

    ##  [1] "No divisible" "No divisible" "No divisible" "No divisible" "No divisible"
    ##  [6] "Divisible"    "No divisible" "No divisible" "No divisible" "No divisible"
    ## [11] "No divisible" "Divisible"    "No divisible" "No divisible" "No divisible"
    ## [16] "No divisible" "No divisible" "Divisible"    "No divisible" "No divisible"

``` r
knitr::knit_exit()
```
