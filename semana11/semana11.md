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



# Solución Práctico 10

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
  
  
## Pregunta 1:


```r
cangrejos <- read.csv("../semana8_9/datos/datos_cangrejos.txt")

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
cangrejos$id1 <- paste(cangrejos$Year, 
                       cangrejos$Sector,
                       sep = " ")
head(cangrejos)
```

```
##   Year   Sector Month Sex C_Length           id1
## 1 2013 Sector_1    11   F   123.64 2013 Sector_1
## 2 2013 Sector_1    11   F   118.47 2013 Sector_1
## 3 2013 Sector_1    11   F   115.53 2013 Sector_1
## 4 2013 Sector_1    11   F   113.98 2013 Sector_1
## 5 2013 Sector_1    11   F   108.75 2013 Sector_1
## 6 2013 Sector_1    11   F   106.12 2013 Sector_1
```

```r
etiqueta1 <- unique(cangrejos$id1)

out <- 
  data.frame(
  anio = NA,
  promedio = NA
)[-1,]

for (i in seq_along(etiqueta1)) {
  
  datosFiltrados <- cangrejos[cangrejos$id1 == etiqueta1[i],]
  
  n_filtrado <- length(datosFiltrados$id1)
  
  if (n_filtrado > 500) {
    
    promedio <- data.frame(
      anio = etiqueta1[i],
      promedio = mean(datosFiltrados$C_Length, na.rm = T))
    
  } else { 
    
    promedio <- NA
    
    }
  
  out <- rbind(out, promedio)
  
}


mean(na.omit(datosFiltrados$C_Length))
```

```
## [1] 127.95
```

```r
mean(datosFiltrados$C_Length, na.rm = T)
```

```
## [1] 127.95
```



```r
#Pregunta 2
head(cangrejos)
```

```
##   Year   Sector Month Sex C_Length           id1
## 1 2013 Sector_1    11   F   123.64 2013 Sector_1
## 2 2013 Sector_1    11   F   118.47 2013 Sector_1
## 3 2013 Sector_1    11   F   115.53 2013 Sector_1
## 4 2013 Sector_1    11   F   113.98 2013 Sector_1
## 5 2013 Sector_1    11   F   108.75 2013 Sector_1
## 6 2013 Sector_1    11   F   106.12 2013 Sector_1
```

```r
#- Calcule los promedios mensuales de las tallas de los cangrejos (C_Length) para cada año para las hembras en condición "F" y "O".
#Year
#Month
#Sex


cangrejos$id2 <- paste(cangrejos$Year,
                       cangrejos$Month,
                       cangrejos$Sex)

etiqueta2 <- unique(cangrejos$id2)

out2 <- data.frame(
  anio = NA,
  promedio = NA
)[-1,]

for (i in seq_along(etiqueta2)) {
  
  datosF <- cangrejos[cangrejos$id2 == etiqueta2[i],]
  
  n <- length(datosF$Year)
  
  if (n > 500) {
    
    promedio <- data.frame(
      anio = etiqueta2[i],
      promedio = mean(datosF$C_Length, na.rm = TRUE))
    
  } else {
    
     promedio <- data.frame(
     anio = etiqueta2[i],
     promedio = NA)
    
  }
  
  out2 <- rbind(out2, promedio)
  
}
```



