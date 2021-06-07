---
title: "Semana 11"
author: "Angelo AC"
date: "07-06-2021"
output: 
  html_document: 
    keep_md: yes
editor_options: 
  chunk_output_type: console
---



### Solución Práctico 10

Utilizando los datos de cangrejos (datos_cangrejo.txt):

- Calcule los promedios anuales de la talla de los cangrejos (C_Length) para el Sector 1 y Sector 2

- Calcule los promedios mensuales de las tallas de los cangrejos (C_Length) para cada año para las hembras en condición "F" y "O".

- Entregar los códigos realizados en clases

**Consideraciones**

Haga los cálculos **SOLO** si hay más de 500 datos por mes. Si los datos son menores o iguales a 500 asigne NA al promedio.

Entregue los resultados resumidos en un dataframe por cada pregunta

Dataframe pregunta 1:

  - Columna 1 : Años
  
  - Columna 2 : Promedio Tallas (C_Length) Sector 1
  
  - Columna 3 : Promedio Tallas (C_Length) Sector 2

Dataframe pregunta 2:

  - Columna 1 : Años
  
  - Columna 2 : Meses
  
  - Columna 3 : Promedio talla condición F
  
  - Columna 4 : Promedio talla condición O
  
  
#### Pregunta 1:


```r
#Importando datos
cangrejos <- read.csv("../semana8_9/datos/datos_cangrejos.txt")
#cangrejos <- read.csv("semana8_9/datos/datos_cangrejos.txt")

head(cangrejos)
```

```
##   Year   Sector Month Sex C_Length
## 1 2013 Sector_1    11   F   123.64
## 2 2013 Sector_1    11   F   118.47
## 3 2013 Sector_1    11   F   115.53
## 4 2013 Sector_1    11   F   113.98
## 5 2013 Sector_1    11   F   108.75
## 6 2013 Sector_1    11   F   106.12
```

```r
#Crear un identificador para el bucle
cangrejos$id1 <- paste(cangrejos$Year, cangrejos$Sector, sep = " ")

etiqueta1 <- unique(cangrejos$id1)

#Crear un dataframe para indexar valores resultantes del bucle
out1 <- data.frame(
  etiqueta = NA,
  promedio = NA,
  n = NA
)[-1,]

#Inicio del bucle
for (i in seq_along(etiqueta1)) {
  
  #Filtra el dataframe en función al identificador
  datosFiltrados <- cangrejos[cangrejos$id1 == etiqueta1[i],]

  #Determinar el Tamaño del dataframe filtrado
  n_filtrado <- length(datosFiltrados$Year)
  
  #Inicia condición
  if (n_filtrado > 500) {
    
    #Crea un dataframe donde incluye la etiqueta y el
    #promedio si se cumple la condición propuesta
    promedio <- data.frame(
      etiqueta = etiqueta1[i],
      promedio = mean(datosFiltrados$C_Length, na.rm = T),
      n = n_filtrado)
    
  } else { 
    
    #Crea un dataframe donde incluye la etiqueta y el
    #promedio si no se cumple la condición propuesta
    promedio <- data.frame(
      etiqueta = etiqueta1[i],
      promedio = NA,
      n = n_filtrado)
    
    }
  
  #Une los dataframe creados
  out1 <- rbind(out1, promedio)
  
}

out1
```

```
##         etiqueta promedio     n
## 1  2013 Sector_1 106.2949  6615
## 2  2012 Sector_1 105.4155  3408
## 3  2011 Sector_1 104.9442 12109
## 4  2012 Sector_2 105.1452  7055
## 5  2011 Sector_2 105.0778  8345
## 6  2008 Sector_2 103.0220 13858
## 7  2010 Sector_2 104.9891  3673
## 8  2009 Sector_2 104.0445  3631
## 9  2013 Sector_2 106.9892 12317
## 10 2014 Sector_1       NA     2
```

#### Pregunta 2:


```r
#Crear identificador para el bucle
cangrejos$id2 <- paste(cangrejos$Year,
                       cangrejos$Month,
                       cangrejos$Sex)

etiqueta2 <- unique(cangrejos$id2)

#Crear un dataframe para indexar los valores resultantes del bucle
out2 <- data.frame(
  etiqueta = NA,
  promedio = NA,
  n_filtrado = NA
)[-1,]

#Inicio del bucle
for (i in seq_along(etiqueta2)) {
  
  #Filtra el dataframe en función al identificador
  datosFiltrados <- cangrejos[cangrejos$id2 == etiqueta2[i],]
  
  #Determina el Tamaño del dataframe filtrado
  n_filtrado <- length(datosFiltrados$Year)
  
  #Inicia condición
  if (n_filtrado > 500) {
    
    #Crea un dataframe donde incluye la etiqueta y el
    #promedio si se cumple la condición propuesta
    promedio <- data.frame(
      etiqueta = etiqueta2[i],
      promedio = mean(datosFiltrados$C_Length, na.rm = TRUE),
      n = n_filtrado)
    
  } else {
    
    #Crea un dataframe donde incluye la etiqueta y el
    #promedio si no se cumple la condición propuesta
     promedio <- data.frame(
     etiqueta = etiqueta2[i],
     promedio = NA,
     n = n_filtrado)
    
  }
  
  #Une los dataframe creados
  out2 <- rbind(out2, promedio)
  
}

out2
```

```
##     etiqueta  promedio    n
## 1  2013 11 F 108.49572 1926
## 2  2013 11 O 104.54031  514
## 3  2012 10 O 105.39651  745
## 4  2012 10 F 107.70965 1155
## 5  2012 11 F 106.17317 2078
## 6  2012 11 O 103.70045  830
## 7  2012 12 O        NA  155
## 8  2012 12 F 105.01507  959
## 9   2012 1 F 106.02415  833
## 10  2012 1 O        NA   43
## 11  2012 2 F 102.66340 1132
## 12  2012 2 O        NA   47
## 13  2012 3 O        NA   61
## 14  2012 3 F 104.84086 1412
## 15  2013 4 F 105.49573 1990
## 16  2012 4 F 104.42140  942
## 17  2013 5 F        NA  301
## 18 2011 10 O 101.51570  554
## 19 2011 10 F 106.56504 1130
## 20  2011 3 F 104.23158 1390
## 21  2011 2 F 105.10386 4559
## 22  2011 2 O        NA  220
## 23 2011 11 O  99.89108 1177
## 24 2011 11 F 105.45701 2455
## 25  2011 4 F 109.26935  535
## 26  2011 1 F 104.62810 5026
## 27  2011 1 O        NA  382
## 28 2011 12 F 107.18986 2636
## 29 2011 12 O        NA  349
## 30  2011 4 O        NA    8
## 31  2011 3 O        NA   33
## 32  2012 4 O        NA   38
## 33 2008 10 F 105.69042 1114
## 34 2008 10 O        NA  397
## 35 2008 11 F 103.44880 1957
## 36 2008 11 O        NA  248
## 37  2008 1 F 103.35168 4167
## 38 2008 12 F 103.46594 2018
## 39 2008 12 O        NA   93
## 40  2008 1 O        NA   88
## 41  2008 2 F 101.11284 1098
## 42  2008 2 O        NA   51
## 43  2008 3 F 103.19244  848
## 44  2008 3 O        NA   67
## 45  2008 4 F 101.19150 1530
## 46  2008 4 O        NA  182
## 47 2010 12 F 105.35656 1455
## 48 2010 12 O        NA  148
## 49 2010 10 F 106.08666 1282
## 50 2010 10 O        NA  365
## 51 2010 11 F        NA  380
## 52 2010 11 O        NA   43
## 53 2009 10 F 105.85679 1272
## 54 2009 10 O        NA  321
## 55 2009 11 F 104.42139 1407
## 56 2009 11 O        NA  267
## 57 2009 12 F        NA  323
## 58 2009 12 O        NA   41
## 59  2012 7 O        NA    1
## 60  2012 8 O        NA   18
## 61  2012 9 O        NA   14
## 62 2013 10 F 107.66973 1863
## 63 2013 10 O 104.90627  584
## 64  2013 7 O        NA   23
## 65  2013 8 O        NA    5
## 66  2013 6 O        NA    5
## 67  2013 4 O        NA   51
## 68 2013 12 O        NA  298
## 69 2013 12 F 107.89151 2825
## 70  2013 1 F 106.87656 4169
## 71  2013 1 O        NA  208
## 72  2014 1 O        NA    2
## 73  2013 2 F 107.01698 2532
## 74  2013 2 O        NA   53
## 75  2013 3 F 105.41964 1527
## 76  2013 3 O        NA   56
## 77  2013 5 O        NA    2
```



