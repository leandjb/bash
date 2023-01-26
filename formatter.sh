#!/bin/bash
#AUTHOR: Leandro Barros\
#EMAIL: leandjb@gmail.com

#SCRIPT PARA RENOMBRAR ARCHIVOS DWH

#Obtenemos la fecha actual
DATE=$(date +%Y_%m_%d)

#Cambiamos a la carpeta IN
cd IN

#Obtenemos los nombres de los archivos dentro de la carpeta
FILES=$(ls)

#Recorremos los archivos
for FILE in $FILES
do
  #Extraemos el REFTAB del nombre del archivo
  REFTAB=$(echo $FILE | cut -d '_' -f 3)

  #Asignamos el valor de DWH correspondiente al REFTAB
  case $REFTAB in
    MA) DWH="MERCHANT_ACCOUNT";;
    MP) DWH="MERCHANT_PROFILE";;
    MR) DWH="MERCHANT_REFERENCE";;
    MS) DWH="MERCHANT_SERVICES";;
    AD) DWH="ADDRESS";;
    AF) DWH="ACCOUNT_FEES";;
    TR) DWH="CLEARING";;
    FA) DWH="FUNDING_ACCOUNT";;
    CS) DWH="CHARGEBACK";;
    ID) DWH="INTERCHANGE_DETAILS";;
    TC) DWH="TRANSACTION_CHARGES";;
    BM) DWH="MASTERCARD_BINS";;
    BV) DWH="VISA_BINS";;
    AU) DWH="AUTHORIZATIONS";;
  esac

  #Creamos el nombre del archivo renombrado
  NEW_NAME="ADQ_DWH_${DWH}_${DATE}.csv"

  #Renombramos el archivo
  mv $FILE $NEW_NAME

  #Movemos el archivo a la carpeta OUT
  mv $NEW_NAME ../OUT

done