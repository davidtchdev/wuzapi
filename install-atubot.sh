#!/bin/bash

# Limpiar consola
clear

# Actualizar e instalar dependencias
echo "Actualizando e instalando dependencias..."
echo "1/6"
apt update 
echo "2/6"
apt upgrade -y
echo "3/6"
apt install -y git golang 

# Clonar el repositorio de WuzAPI desde tu repositorio
echo "Clonando repositorio..."
echo "4/6"
git clone https://github.com/davidtchdev/wuzapi.git 

# Navegar al directorio de WuzAPI
cd wuzapi

# Instalar dependencias de Go
echo "Instalando dependencias de Go..."
echo "5/6"
go mod tidy 

echo "Compilando binario..."
echo "6/6"
# Verificar si se necesitan permisos de root para compilar
if ! go build 
    echo "Se necesitan permisos de root para compilar. Instalando tsu..."

    # Instalar tsu
    apt install -y tsu 

    # Usar tsu para compilar
    tsu -c "go build"
else
    # Compilar el proyecto
    go build 
fi

# Configurar permisos si es necesario
chmod +x ./wuzapi >

# Ejecutar el binario
echo "Ejecutando el binario..."
./wuzapi
