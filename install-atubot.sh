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
curl -L -o atubot_arm64.zip https://github.com/davidtchdev/wuzapi/releases/download/Assets/atubot_arm64.zip

# Descomprimir el archivo
echo "Descomprimiendo archivo..."
unzip atubot_arm64.zip

# Hacer el binario ejecutable
chmod +x ./atubot_arm64

# Ejecutar el binario
./atubot_arm64
