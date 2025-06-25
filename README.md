# mantishield-examples
MantiShield API - Ejemplos de Cliente
Este repositorio contiene ejemplos de código para interactuar con la API de MantiShield. Aquí encontrarás scripts listos para usar que te ayudarán a integrar el escaneo de vulnerabilidades en tus propios proyectos.

🚀 Cómo Empezar
1. Prerrequisitos
Tener una API Key de MantiShield.

Tener curl y jq (para los ejemplos en Bash) o Python 3 (para los ejemplos en Python).

2. Configuración
Para evitar exponer tu API Key en los scripts, la leeremos desde variables de entorno.

En Linux o macOS:

export MANTISHIELD_API_KEY="TuClaveSuperSecretaAqui"
export MANTISHIELD_API_URL="http://api.mantishield.xyz"

En Windows (Command Prompt):

set MANTISHIELD_API_KEY="TuClaveSuperSecretaAqui"
set MANTISHIELD_API_URL="http://api.mantishield.xyz"

3. Clonar este Repositorio
git clone https://github.com/Jawy77/mantishield-examples.git
cd mantishield-examples

💡 Ejemplos de Uso
Hemos incluido ejemplos en Bash y Python.

Ejemplo con Bash/cURL
Este script envía un paquete para ser escaneado y luego consulta los resultados.

Uso:

cd examples/bash
./scan_and_check.sh requests 2.20.0

Ejemplo con Python
Este script hace lo mismo que el de Bash, pero usando un script de Python.

Instalar dependencias:

pip install requests

Uso:

cd examples/python
python main.py requests 2.20.0

¿Necesitas ayuda? Contacta a nuestro soporte en soporte@mantishield.xyz.

API usage examples
