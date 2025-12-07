# Plataforma Marketplace - Young AI Leaders Group

## Descripción del Proyecto
Esta es una plataforma marketplace construida con backend Django y frontend React. La plataforma permite a los usuarios comprar y vender productos en un entorno marketplace dinámico.

## Estructura del Proyecto
```
hackathon-young-ai-leaders-group-reusapp/
├── backend/                 # Django Backend
│   ├── api/                # Django apps
│   │   ├── users/          # User management
│   │   ├── products/       # Product management
│   │   ├── orders/         # Order processing
│   │   ├── messages/       # Messaging system
│   │   ├── notifications/  # Notifications
│   │   ├── payments/       # Payment processing
│   ├── static/             # Static files
│   ├── media/              # Media files
│   ├── manage.py           # Django management script
│   ├── requirements.txt    # Python dependencies
│   └── .env.example        # Variables de entorno (ejemplo)
├── frontend/               # React Frontend
│   ├── src/                # Source code
│   │   ├── components/     # React components
│   │   ├── containers/     # Container components
│   │   ├── utils/          # Utility functions
│   │   ├── assets/         # Static assets
│   │   ├── styles/         # Global styles
│   │   ├── api/            # API calls
│   │   └── context/        # React context
│   ├── public/             # Public files
│   ├── package.json        # Node.js dependencies
│   └── .env.example        # Variables de entorno (ejemplo)
├── docs/                   # Documentation
├── tests/                  # Test files
├── deploy/                 # Deployment configurations
├── scripts/                # Utility scripts
├── .gitignore              # Git ignore file
└── README.md               # Project documentation
```

## Instrucciones para comenzar

### Para nuevos colaboradores
1. Haz un fork del repositorio
2. Clona tu fork: `git clone https://github.com/tu_usuario/hackathon-young-ai-leaders-group-reusapp.git`
3. Navega al directorio del proyecto: `cd hackathon-young-ai-leaders-group-reusapp`
4. Sigue las instrucciones de configuración a continuación

### Configuración del Backend
1. Navega al directorio backend: `cd backend`
2. Crea un entorno virtual: `python -m venv venv`
3. Activa el entorno virtual:
   - En Linux/Mac: `source venv/bin/activate`
   - En Windows: `venv\Scripts\activate`
4. Instala las dependencias: `pip install -r requirements.txt`
5. Crea el archivo de entorno: `cp .env.example .env`
6. Configura las variables de entorno en `.env`
7. Ejecuta las migraciones: `python manage.py migrate`
8. Inicia el servidor de desarrollo: `python manage.py runserver`

### Configuración del Frontend
1. Navega al directorio frontend: `cd frontend`
2. Instala las dependencias: `npm install`
3. Crea el archivo de entorno: `cp .env.example .env`
4. Configura las variables de entorno en `.env`
5. Inicia el servidor de desarrollo: `npm start`

## Tecnologías utilizadas
- Backend: Django, Django REST Framework, Python
- Frontend: React, JavaScript, CSS
- Base de datos: PostgreSQL (o SQLite para desarrollo)
- Otros: Node.js, npm

## Características
- Autenticación y autorización de usuarios
- Listado y gestión de productos
- Funcionalidad de carrito de compras
- Procesamiento de pedidos
- Integración de pagos
- Sistema de mensajería
- Notificaciones
- Interfaz responsiva

## Documentación adicional
- [Guía de configuración detallada](./docs/setup.md)
- [Comandos útiles](./docs/commands.md)
- [Cómo ejecutar localmente](./docs/running.md)
- [Guía de contribución](./docs/contributing.md)

## Comenzando el desarrollo
1. Asegúrate de tener Python 3.8+ y Node.js 16+ instalados
2. Sigue las instrucciones de configuración anteriores
3. Para ejecutar ambos servidores simultáneamente, consulta la [guía de ejecución local](./docs/running.md)