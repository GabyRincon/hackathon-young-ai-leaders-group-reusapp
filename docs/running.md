# Ejecución local del proyecto completo

## Método 1: Ejecución manual de ambos servidores

### Opción A: En terminales separadas

1. Abre una terminal y navega al directorio del backend:
   ```bash
   cd hackathon-young-ai-leaders-group-reusapp/backend
   ```

2. Activa el entorno virtual e inicia el servidor:
   ```bash
   source venv/bin/activate  # En Linux/Mac
   # o
   venv\Scripts\activate     # En Windows
   
   python manage.py runserver
   ```

3. Abre otra terminal y navega al directorio del frontend:
   ```bash
   cd hackathon-young-ai-leaders-group-reusapp/frontend
   ```

4. Inicia el servidor del frontend:
   ```bash
   npm start
   ```

### Opción B: En una sola terminal (con comandos en segundo plano)

1. Inicia el backend en segundo plano:
   ```bash
   cd backend && source venv/bin/activate && python manage.py runserver &
   ```

2. Espera unos segundos y luego inicia el frontend:
   ```bash
   cd frontend && npm start
   ```

## Método 2: Usando un script de inicio

Puedes crear un script para automatizar la ejecución de ambos servidores. Crea el archivo `start-dev.sh` en la raíz del proyecto:

```bash
#!/bin/bash

# Iniciar backend en segundo plano
echo "Iniciando backend..."
cd backend
source venv/bin/activate
python manage.py runserver &
BACKEND_PID=$!
cd ..

# Esperar un momento para que el backend inicie
sleep 3

# Iniciar frontend
echo "Iniciando frontend..."
cd frontend
npm start

# Cuando se detenga el frontend, detener también el backend
kill $BACKEND_PID 2>/dev/null
```

Y un archivo para Windows `start-dev.bat`:

```batch
@echo off
echo Iniciando backend...
cd backend
call venv\Scripts\activate
start /min python manage.py runserver
timeout /t 5 /nobreak >nul
echo Iniciando frontend...
cd ../frontend
npm start
```

## URLs de acceso

Una vez que ambos servidores estén corriendo:

- **Backend (API)**: http://localhost:8000
  - Acceso al panel de administración: http://localhost:8000/admin/
- **Frontend**: http://localhost:3000
- **Documentación de la API** (si se implementa): http://localhost:8000/api/docs/

## Verificación de estado de los servidores

Para verificar que ambos servidores estén corriendo:

1. Backend: Accede a http://localhost:8000/ en tu navegador
2. Frontend: Accede a http://localhost:3000/ en tu navegador

## Solución de problemas comunes

### Puertos ocupados
Si los puertos 8000 o 3000 están ocupados:
- Para el backend, usa: `python manage.py runserver 8001`
- Para el frontend, normalmente se detecta automáticamente otro puerto (3001, 3002, etc.)

### Errores de CORS
Asegúrate de que las configuraciones de CORS en el backend permitan la conexión desde el frontend:
```python
# En settings.py del backend
CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]
```

### Errores de dependencias
Si tienes problemas con las dependencias:
1. En el backend:
   ```bash
   pip install -r requirements.txt
   ```
2. En el frontend:
   ```bash
   npm install
   ```