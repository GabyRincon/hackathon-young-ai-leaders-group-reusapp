# Configuración del Proyecto

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado:

- Python 3.8 o superior
- Node.js 16 o superior
- npm o yarn
- Git
- PostgreSQL (opcional para producción, SQLite se usa por defecto en desarrollo)

## Configuración del entorno

### Backend (Django)

1. Navega al directorio backend:
   ```bash
   cd backend
   ```

2. Crea un entorno virtual:
   ```bash
   python -m venv venv
   ```

3. Activa el entorno virtual:
   - En Linux/Mac:
     ```bash
     source venv/bin/activate
     ```
   - En Windows:
     ```bash
     venv\Scripts\activate
     ```

4. Instala las dependencias:
   ```bash
   pip install -r requirements.txt
   ```

5. Crea el archivo .env con las variables necesarias:
   ```bash
   cp .env.example .env
   ```
   (Configura las variables según sea necesario)

6. Ejecuta las migraciones:
   ```bash
   python manage.py migrate
   ```

7. Crea un superusuario (opcional):
   ```bash
   python manage.py createsuperuser
   ```

8. Inicia el servidor de desarrollo:
   ```bash
   python manage.py runserver
   ```

El backend estará disponible en `http://localhost:8000`

### Frontend (React)

1. Navega al directorio frontend:
   ```bash
   cd frontend
   ```

2. Instala las dependencias:
   ```bash
   npm install
   ```

3. Crea el archivo .env con las variables necesarias:
   ```bash
   cp .env.example .env
   ```
   (Configura las variables según sea necesario)

4. Inicia el servidor de desarrollo:
   ```bash
   npm start
   ```

El frontend estará disponible en `http://localhost:3000`

## Comandos útiles

### Backend
- Ejecutar pruebas: `python manage.py test`
- Crear migraciones: `python manage.py makemigrations`
- Aplicar migraciones: `python manage.py migrate`
- Iniciar shell de Django: `python manage.py shell`

### Frontend
- Ejecutar pruebas: `npm test`
- Crear build de producción: `npm run build`
- Ejecutar linter: `npm run lint`

## Estructura de directorios del backend

```
backend/
├── api/                    # Aplicaciones Django
│   ├── users/              # Gestión de usuarios
│   ├── products/           # Gestión de productos
│   ├── orders/             # Procesamiento de pedidos
│   ├── messages/           # Sistema de mensajería
│   ├── notifications/      # Notificaciones
│   └── payments/           # Procesamiento de pagos
├── static/                 # Archivos estáticos
├── media/                  # Archivos multimedia
├── manage.py               # Script de gestión de Django
└── requirements.txt        # Dependencias de Python
```

## Estructura de directorios del frontend

```
frontend/
├── src/                    # Código fuente
│   ├── components/         # Componentes React
│   ├── containers/         # Componentes contenedores
│   ├── utils/              # Funciones de utilidad
│   ├── assets/             # Recursos estáticos
│   ├── styles/             # Estilos globales
│   ├── api/                # Llamadas a la API
│   └── context/            # Contexto de React
├── public/                 # Archivos públicos
├── package.json            # Dependencias de Node.js
└── README.md               # Documentación del frontend
```

## Variables de entorno

### Backend
- `SECRET_KEY`: Clave secreta de Django
- `DEBUG`: Modo debug (True/False)
- `DATABASE_URL`: URL de la base de datos
- `ALLOWED_HOSTS`: Lista de hosts permitidos

### Frontend
- `REACT_APP_API_URL`: URL del backend
- `REACT_APP_ENV`: Entorno (development/production)