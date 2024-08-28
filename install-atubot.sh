#!/bin/bash

# Limpiar consola
clear

# Actualizar e instalar dependencias
echo "Actualizando e instalando dependencias..."
apt update > /dev/null 2>&1
apt upgrade -y > /dev/null 2>&1
apt install -y git golang > /dev/null 2>&1

# Clonar el repositorio de WuzAPI desde tu repositorio
echo "Clonando repositorio..."
git clone https://github.com/davidtchdev/wuzapi.git > /dev/null 2>&1

# Navegar al directorio de WuzAPI
cd wuzapi

# Instalar dependencias de Go
echo "Instalando dependencias de Go..."
go mod tidy > /dev/null 2>&1

echo "Compilando binario..."
# Verificar si se necesitan permisos de root para compilar
if ! go build > /dev/null 2>&1; then
    echo "Se necesitan permisos de root para compilar. Instalando tsu..."

    # Instalar tsu
    apt install -y tsu > /dev/null 2>&1

    # Usar tsu para compilar
    tsu -c "go build > /dev/null 2>&1"
else
    # Compilar el proyecto
    go build > /dev/null 2>&1
fi

# Configurar permisos si es necesario
chmod +x ./wuzapi > /dev/null 2>&1

# Ejecutar el binario
echo "Ejecutando el binario..."
./wuzapi
