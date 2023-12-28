

###pacotes necessários para análise de dados desta pesquisa

library(sidrar)
library(tidyverse)

#Coleta de Dados


ipca_raw<- sidrar::get_sidra(api = "/t/1737/n1/all/v/2265/p/all/d/v2265%202")


###Limpeza dos dados 

dplyr::glimpse(ipca)


ipca <- ipca_raw |>
dplyr::select ("Data"= "Mês (Código)",
               "Ipca" = "Valor") |>
  
dplyr::mutate(Data= lubridate:: ym(Data)) |>

dplyr::filter(Data >= "2004-01-01") |>
  dplyr::as_tibble()

#####Análise exploratória 


ggplot2::ggplot(ipca)+
  ggplot2::aes(x= Data, y=Ipca)+
  ggplot2::geom_line()


summary(ipca)

ggplot2::ggplot(ipca)+
  ggplot2::aes(y=Ipca)+
  ggplot2::geom_boxplot()


  

ggplot2::ggplot(ipca)+
  ggplot2::aes(x=Ipca)+
  ggplot2:: geom_histogram()




####Taxa de desocupação

desocupacao_raw<- sidrar::get_sidra(api="/t/6381/n1/all/v/4099/p/all/d/v4099%201")


desocupacao <- desocupacao_raw |>
dplyr::select('Data'= "Trimestre Móvel (Código)", "desocupacao"= "Valor") |>
  dplyr::mutate(Data= lubridate:: ym(Data)) |>
  dplyr::as_tibble()

df_dados <- ipca |>
  inner_join(desocupacao, by= "Data")



  
 

  
  
  

     
   
     
     
    
  

  




  
  




















