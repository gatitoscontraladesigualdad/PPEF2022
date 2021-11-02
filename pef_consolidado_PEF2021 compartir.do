***************
 *2022
***************
 clear all
 
 *clear all
 *Pueden descargar las bases de datos en formato csv desde Transparencia presupuestaria, o en DTA desde aquí: https://bit.ly/3bzELAa 
 use "PPEF_2022.dta", clear
 destring   monto_proyecto , replace
 destring   id_ramo, replace force
 destring   gpo_funcional, replace force

 generate anio=2022

 ******Totales
 tabstat monto_proyecto, s(sum)  format(%22.2fc)
 tabstat monto_proyecto, by (desc_gpo_funcional) s(sum)  format(%22.2fc)
 
 
  ***** Clasificación funcional
 tabstat monto_proyecto if  gpo_funcional==2, by (id_funcion) s(sum)  format(%22.2fc)
 tabstat monto_proyecto if  gpo_funcional==2, by (desc_funcion) s(sum)  format(%22.2fc)
 
 tabstat monto_proyecto if  desc_tipogasto=="Pensiones y jubilaciones", by (desc_funcion) s(sum)  format(%22.2fc)
 
 
 
 ***Programas sociales
   *Pensión adultos mayores
 tabstat monto_proyecto if (id_ramo==20 &  id_modalidad=="S" & id_pp==176) , by (desc_pp) s(sum)  format(%22.2fc)
 
    *BBJ media superior
 tabstat monto_proyecto if (id_ramo==11 &  id_modalidad=="S" & id_pp==311) , by (desc_pp) s(sum)  format(%22.2fc) 
 
  *INSABI
 tabstat monto_proyecto if ((id_ramo==12 &  id_modalidad=="U" & id_pp==13) | (id_ramo==12 &  id_modalidad=="U" & id_pp==005) | (id_ramo==12 &  id_modalidad=="S" & id_pp==201)), by (desc_pp) s(sum)  format(%22.2fc)

*Y sumarle: Aportaciones Federales para Entidades Federativas y Municipios (FASSA Salud)
 tabstat monto_proyecto if (id_ramo==33  & desc_pp=="FASSA") , by (desc_funcion) s(sum)  format(%22.2fc)
 
     *BBJ Básica
 tabstat monto_proyecto if (id_ramo==11 &  id_modalidad=="S" & id_pp==72) , by (desc_pp) s(sum)  format(%22.2fc)
 
     *Sembrando vida
 tabstat monto_proyecto if (id_ramo==20 &  id_modalidad=="S" & id_pp==287) , by (desc_pp) s(sum)  format(%22.2fc)
 
      *Jov construyendo el futuro
 tabstat monto_proyecto if (id_ramo==14 &  id_modalidad=="S" & id_pp==280) , by (desc_pp) s(sum)  format(%22.2fc)
 
       *Pensión para el bienestar de personas con discapacidad
 tabstat monto_proyecto if (id_ramo==20 &  id_modalidad=="S" & id_pp==286) , by (desc_pp) s(sum)  format(%22.2fc)
 
        *Producción para el bienestar
*2021 tabstat monto_proyecto if (id_ramo==8 &  id_modalidad=="U" & id_pp==23) , by (desc_pp) s(sum)  format(%22.2fc)
*2022 
 tabstat monto_proyecto if (id_ramo==8 &  id_modalidad=="S" & id_pp==293) , by (desc_pp) s(sum)  format(%22.2fc)
 
 *La escuela es nuestra
 tabstat monto_proyecto if (id_ramo==11 &  id_modalidad=="U" & id_pp==282) , by (desc_pp) s(sum)  format(%22.2fc)
 
 *Precios de Garantía 
 *2021  tabstat monto_proyecto if (id_ramo==8 &  id_modalidad=="U" & id_pp==20) , by (desc_pp) s(sum)  format(%22.2fc)
  tabstat monto_proyecto if (id_ramo==8 &  id_modalidad=="S" & id_pp==290) , by (desc_pp) s(sum)  format(%22.2fc)
 
 
 *Beca Jóvenes Escribiendo el Futuro
 * 2021 tabstat monto_proyecto if (id_ramo==11 &  id_modalidad=="U" & id_pp==280) , by (desc_pp) s(sum)  format(%22.2fc)
 tabstat monto_proyecto if (id_ramo==11 &  id_modalidad=="S" & id_pp==283) , by (desc_pp) s(sum)  format(%22.2fc)
 

  *Programa de apoyo para el Bienestar de las Niñas y Niños, Hijos de Madres Trabajadoras
 tabstat monto_proyecto if (id_ramo==20 &  id_modalidad=="S" & id_pp==174) , by (desc_pp) s(sum)  format(%22.2fc)
 
 *Programa de Microcréditos para el Bienestar (conocido como Tandas para el Bienestar)
 *Ya no existe en 2022
 *tabstat monto_proyecto if (id_ramo==10 &  id_modalidad=="S" & id_pp==285) , by (desc_pp) s(sum)  format(%22.2fc)
 
   *Universidades para el Bienestar Benito Juárez García

 tabstat monto_proyecto if (id_ramo==11 &  id_modalidad=="U" & id_pp==083) , by (desc_pp) s(sum)  format(%22.2fc)
 

 ******SALUD
 
 *SSA
 tabstat monto_proyecto if id_ramo==12, by (desc_funcion) s(sum)  format(%22.2fc)
 tabstat monto_proyecto if id_ramo==12 & desc_funcion=="Salud", by (desc_pp) s(sum)  format(%22.2fc)
 
 *IMSS
 tabstat monto_proyecto if id_ramo==50, by (desc_funcion) s(sum)  format(%22.2fc)
 tabstat monto_proyecto if id_ramo==50 & desc_funcion=="Salud", by (desc_pp) s(sum)  format(%22.2fc)
 
 *INSABI * Falta sumar FASSA y otros
 tabstat monto_proyecto if ((id_ramo==12 &  id_modalidad=="U" & id_pp==13) | (id_ramo==12 &  id_modalidad=="U" & id_pp==005) | (id_ramo==12 &  id_modalidad=="S" & id_pp==201)) | ((desc_funcion=="Salud") & (id_ramo==12 &  id_modalidad=="E" & id_pp==23)), by (desc_pp) s(sum)  format(%22.2fc)
 tabstat monto_proyecto if (desc_funcion=="Salud") & (id_ramo==12 &  id_modalidad=="E" & id_pp==23), by (desc_pp) s(sum)  format(%22.2fc)
 
 *FASSA
 tabstat monto_proyecto if id_ramo==33, by (desc_funcion) s(sum)  format(%22.2fc)
 
 *ISSSTE
 tabstat monto_proyecto if id_ramo==51, by (desc_funcion) s(sum)  format(%22.2fc)
 
 *Ramo 19 / Aportaciones a Seg. Social
 tabstat monto_proyecto if id_ramo==19, by (desc_funcion) s(sum)  format(%22.2fc)
 tabstat monto_proyecto if id_ramo==19 & desc_funcion=="Salud", by (desc_pp) s(sum)  format(%22.2fc)
 
 *PEMEX
 tabstat monto_proyecto if (id_ramo==52 &  id_modalidad=="E" & id_pp==13), by (desc_funcion) s(sum)  format(%22.2fc)
 
 *SEDENA
 tabstat monto_proyecto if id_ramo==7, by (desc_funcion) s(sum)  format(%22.2fc)
 
 *SEMAR
 tabstat monto_proyecto if id_ramo==13, by (desc_funcion) s(sum)  format(%22.2fc)
 
 
