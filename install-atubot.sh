#!/bin/bash

# Limpiar consola
clear

# Actualizar e instalar dependencias necesarias
echo "Actualizando e instalando dependencias..."
apt update
apt upgrade -y
apt install -y curl unzip

# Descargar el archivo comprimido desde el repositorio
echo "Descargando archivo comprimido..."
curl -L -o wuzapi.zip https://github.com/davidtchdev/wuzapi/releases/download/Assets/wuzapi.zip

# Descomprimir el archivo
echo "Descomprimiendo archivo..."
unzip wuzapi.zip

# Hacer el binario ejecutable
chmod +x ./wuzapi

# Ejecutar el binario
./wuzapi
