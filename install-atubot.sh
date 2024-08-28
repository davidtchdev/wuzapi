#!/bin/bash

# Limpiar consola
clear

# Actualizar e instalar dependencias necesarias
echo "Actualizando e instalando dependencias..."
apt update
apt upgrade -y
apt install -y curl

# Descargar el binario desde el repositorio
echo "Descargando binario..."
curl -L -o wuzapi https://github.com/davidtchdev/wuzapi/raw/main/bin/wuzapi

# Hacer el binario ejecutable
chmod +x wuzapi

# Ejecutar el binario
./wuzapi