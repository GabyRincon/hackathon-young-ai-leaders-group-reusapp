# Comandos útiles para el desarrollo

## Backend (Django)

### Desarrollo
- Iniciar servidor de desarrollo:
  ```bash
  cd backend && python manage.py runserver
  ```

- Crear migraciones:
  ```bash
  cd backend && python manage.py makemigrations
  ```

- Aplicar migraciones:
  ```bash
  cd backend && python manage.py migrate
  ```

- Crear superusuario:
  ```bash
  cd backend && python manage.py createsuperuser
  ```

- Ejecutar pruebas:
  ```bash
  cd backend && python manage.py test
  ```

- Abrir shell de Django:
  ```bash
  cd backend && python manage.py shell
  ```

### Instalación de dependencias
- Instalar dependencias:
  ```bash
  cd backend && pip install -r requirements.txt
  ```

## Frontend (React)

### Desarrollo
- Iniciar servidor de desarrollo:
  ```bash
  cd frontend && npm start
  ```

- Crear build de producción:
  ```bash
  cd frontend && npm run build
  ```

- Ejecutar pruebas:
  ```bash
  cd frontend && npm test
  ```

### Instalación de dependencias
- Instalar dependencias:
  ```bash
  cd frontend && npm install
  ```

## Git
- Ver estado del repositorio:
  ```bash
  git status
  ```

- Añadir cambios:
  ```bash
  git add .
  ```

- Hacer commit:
  ```bash
  git commit -m "Mensaje del commit"
  ```

- Hacer push:
  ```bash
  git push origin main
  ```

- Obtener cambios remotos:
  ```bash
  git pull origin main
  ```

## Docker (cuando se implemente)
- Construir imágenes:
  ```bash
  docker-compose build
  ```

- Iniciar servicios:
  ```bash
  docker-compose up
  ```

- Iniciar servicios en background:
  ```bash
  docker-compose up -d
  ```

- Detener servicios:
  ```bash
  docker-compose down
  ```