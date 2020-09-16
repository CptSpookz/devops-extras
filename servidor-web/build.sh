#! /bin/bash

if [ ! -f ".keystore" ]; then
    echo "Não foi possível encontrar um keystore, gerando um novo..."
    sudo keytool -genkey -alias tomcat -keyalg RSA -keystore .keystore
fi
echo "Montando container do servidor web..."
docker build -t devops/webserver:latest .