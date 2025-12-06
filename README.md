# Marketplace Platform - Young AI Leaders Group

## Project Overview
This is a marketplace platform built with Django backend and React frontend. The platform allows users to buy and sell products in a dynamic marketplace environment.

## Project Structure
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
│   └── requirements.txt    # Python dependencies
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
│   └── README.md           # Frontend documentation
├── docs/                   # Documentation
├── tests/                  # Test files
├── deploy/                 # Deployment configurations
├── scripts/                # Utility scripts
├── .gitignore              # Git ignore file
└── README.md               # Project documentation
```

## Getting Started

### Backend Setup
1. Navigate to the backend directory: `cd backend`
2. Create a virtual environment: `python -m venv venv`
3. Activate the virtual environment:
   - On Linux/Mac: `source venv/bin/activate`
   - On Windows: `venv\Scripts\activate`
4. Install dependencies: `pip install -r requirements.txt`
5. Run migrations: `python manage.py migrate`
6. Start the development server: `python manage.py runserver`

### Frontend Setup
1. Navigate to the frontend directory: `cd frontend`
2. Install dependencies: `npm install`
3. Start the development server: `npm start`

## Technologies Used
- Backend: Django, Django REST Framework, Python
- Frontend: React, JavaScript, CSS
- Database: PostgreSQL (or SQLite for development)
- Other: Node.js, npm

## Features
- User authentication and authorization
- Product listing and management
- Shopping cart functionality
- Order processing
- Payment integration
- Messaging system
- Notifications
- Responsive UI