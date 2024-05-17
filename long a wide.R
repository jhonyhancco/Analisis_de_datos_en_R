
#Instalamos el paquete de datos tidyverse

install.packages("tidyverse")

#Llamamos al paquete tidyverse
library(tidyverse)

#Leemos la base de datos con el comando read.csv

datos<- read.csv("C:\\Users\\jhony\\Documents\\GitHub\\Analisis_de_datos_en_R\\long_to_wide.csv")

#En este caso agrupamos las variables de valor por Anio y Partida
datos_suma <- datos %>%
  group_by(Anio, Partida, Razon_Soc) %>%
  summarize(Peso_Bruto_Suma_2 = sum(Peso_Bruto_Suma),
            Peso_Neto_Suma_2= sum(Peso_Neto_Suma))

#Una vez agrupados los datos, pasamos a pasar el archivo de formato long a wide

datos_wide <- datos_suma %>%
  pivot_wider(
    names_from = Anio,
    values_from = c(Peso_Bruto_Suma_2,Peso_Neto_Suma_2),
    names_prefix ="Peso_"
  )