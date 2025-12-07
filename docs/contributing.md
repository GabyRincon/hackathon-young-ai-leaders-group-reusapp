# Contribuyendo al proyecto

## Configuración inicial

Antes de comenzar a contribuir, asegúrate de tener el proyecto configurado correctamente siguiendo las instrucciones en [setup.md](./setup.md).

## Flujo de trabajo

1. Haz un fork del repositorio (si no tienes permisos de escritura directa)
2. Crea una rama para tu funcionalidad: `git checkout -b feature/nueva-funcionalidad`
3. Realiza tus cambios
4. Haz commit de tus cambios: `git commit -m "Agrega nueva funcionalidad"`
5. Sube tu rama: `git push origin feature/nueva-funcionalidad`
6. Crea un Pull Request

## Estilo de commits

Usamos el siguiente formato para los mensajes de commit:

```
<tipo>(<ámbito opcional>): <descripción corta>

[descripción larga opcional]

[footer opcional]
```

### Tipos de commits
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en la documentación
- `style`: Cambios de estilo que no afectan la lógica
- `refactor`: Cambios que no corrigen bugs ni agregan funcionalidades
- `test`: Adición o modificación de tests
- `chore`: Otros cambios que no modifican src o test

### Ejemplos de commits
- `feat(auth): Agrega autenticación de usuarios`
- `fix(cart): Corrige error en cálculo de precios`
- `docs(readme): Actualiza instrucciones de instalación`

## Estilo de código

### Backend (Python/Django)
- Sigue las convenciones PEP 8
- Escribe docstrings para funciones y clases
- Mantén las funciones y métodos razonablemente cortos

### Frontend (JavaScript/React)
- Usa funciones flecha para componentes simples
- Sigue las reglas de ESLint definidas en el proyecto
- Escribe comentarios para lógica compleja

## Proceso de revisión

Todos los cambios deben ser revisados por al menos un compañero antes de ser mergeados.

## Reporte de bugs

Cuando reportes un bug, por favor incluye:
- Una descripción clara del problema
- Pasos para reproducirlo
- Comportamiento esperado vs real
- Capturas de pantalla o logs si es posible