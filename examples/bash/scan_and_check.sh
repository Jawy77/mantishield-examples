#!/bin/bash

# Script para escanear un paquete y luego consultar las vulnerabilidades encontradas.
# Lee la API Key y la URL desde variables de entorno para mayor seguridad.

set -e # Termina el script si un comando falla

# 1. Validar que las variables de entorno y los argumentos estén presentes
if [ -z "$MANTISHIELD_API_URL" ] || [ -z "$MANTISHIELD_API_KEY" ]; then
  echo "Error: Por favor, define las variables de entorno MANTISHIELD_API_URL y MANTISHIELD_API_KEY."
  exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <nombre_paquete> <version_paquete>"
    exit 1
fi

PACKAGE_NAME=$1
PACKAGE_VERSION=$2

echo "📦 Enviando '${PACKAGE_NAME}@${PACKAGE_VERSION}' para escaneo..."

# 2. Enviar la petición de escaneo
SCAN_RESPONSE=$(curl -s -X POST "${MANTISHIELD_API_URL}/api/v1/scan" \
-H "Content-Type: application/json" \
-H "X-API-Key: ${MANTISHIELD_API_KEY}" \
-d "{
  \"packages\": [
    { \"name\": \"${PACKAGE_NAME}\", \"version\": \"${PACKAGE_VERSION}\" }
  ]
}")

# Verificar si la petición fue aceptada
STATUS=$(echo $SCAN_RESPONSE | jq -r .status)
if [ "$STATUS" != "QUEUED" ]; then
    echo "❌ Error al encolar el escaneo:"
    echo $SCAN_RESPONSE | jq
    exit 1
fi

echo "✅ Escaneo encolado correctamente. Esperando 10 segundos para que se procese..."

# 3. Esperar y consultar los resultados
sleep 10

echo "🔍 Consultando resultados de vulnerabilidades para '${PACKAGE_NAME}'..."

curl -s -H "X-API-Key: ${MANTISHIELD_API_KEY}" \
"${MANTISHIELD_API_URL}/api/v1/vulnerabilities/${PACKAGE_NAME}" | jq
