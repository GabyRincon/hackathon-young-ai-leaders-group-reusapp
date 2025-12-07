#!/bin/bash

# Script para iniciar ambos servidores (backend y frontend) para acceso remoto

echo "Iniciando servidores para acceso remoto..."

# Iniciar backend en segundo plano
echo "Iniciando backend en puerto 8000..."
cd /home/masterlukasirproductions/hackathon-young-ai-leaders-group-reusapp/backend
source venv/bin/activate
python manage.py runserver 0.0.0.0:8000 &
BACKEND_PID=$!

# Esperar un momento para que el backend inicie
sleep 3

# Iniciar frontend en segundo plano
echo "Iniciando frontend en puerto 3000..."
cd /home/masterlukasirproductions/hackathon-young-ai-leaders-group-reusapp/frontend
npx react-scripts start --host 0.0.0.0 --port 3000

# Si se detiene el frontend, detener también el backend
kill $BACKEND_PID 2>/dev/null