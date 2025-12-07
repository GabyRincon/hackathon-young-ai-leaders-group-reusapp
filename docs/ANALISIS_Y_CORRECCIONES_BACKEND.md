# Análisis Técnico y Plan de Acción para el Backend

**Fecha:** 07 de Diciembre de 2025
**Autor:** Asistente de IA Gemini
**Propósito:** Documentar los problemas de configuración y estructura que impiden la ejecución y despliegue del backend, y proponer un plan de acción coordinado para el equipo de desarrollo.

---

## 1. Resumen Ejecutivo

El backend del proyecto actualmente no puede ser desplegado ni ejecutado debido a una serie de errores críticos de configuración y estructura en el proyecto Django. El análisis del log de despliegue de Render confirma que estos errores impiden que el proceso de construcción (`build`) finalice.

La causa fundamental de la mayoría de estos problemas es una **estructura de proyecto no estándar** que confunde las herramientas automáticas de Django, particularmente el cargador de aplicaciones y el sistema de migraciones.

La buena noticia es que todos los problemas identificados son solucionables. Este documento detalla cada error y su respectiva solución para que el equipo pueda aplicar las correcciones de forma segura.

---

## 2. Diagnóstico General

La estructura de carpetas anidada `backend/api/api/` junto con la nomenclatura de las aplicaciones como `api.users`, `api.products`, etc., crea ambigüedad. Django tiene dificultades para resolver correctamente las rutas de importación y las dependencias entre aplicaciones, lo que desencadena una cascada de errores durante la inicialización y el proceso de migración.

---

## 3. Lista de Errores Encontrados y Soluciones

A continuación, se presenta la secuencia de errores descubiertos durante el proceso de depuración y la solución para cada uno.

### Error 1: `ModuleNotFoundError: No module named 'api.settings'`
-   **Causa:** El archivo `backend/manage.py` especifica una ruta incorrecta (`api.settings`) para el archivo de configuración de Django.
-   **Solución:** Modificar `backend/manage.py` para que apunte a la ruta correcta: `os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'api.api.settings')`.

### Error 2: `ModuleNotFoundError: No module named 'api.urls'`
-   **Causa:** Dentro de `backend/api/api/settings.py`, la variable `ROOT_URLCONF` apunta a una ruta incorrecta (`api.urls`).
-   **Solución:** Modificar `settings.py` para que apunte a la ruta correcta: `ROOT_URLCONF = 'api.api.urls'`.

### Error 3: `ImproperlyConfigured: Application labels aren't unique, duplicates: messages`
-   **Causa:** La aplicación personalizada `api.messages` entra en conflicto con la aplicación integrada de Django `django.contrib.messages`, ya que ambas intentan usar la etiqueta interna "messages".
-   **Solución:** Crear un archivo `backend/api/messages/apps.py` para definir una configuración de aplicación personalizada con una etiqueta única (`label = 'api_messages'`). Luego, actualizar `INSTALLED_APPS` en `settings.py` para que use esta configuración explícita (`'api.messages.apps.MessagesConfig'`).

### Error 4: `ModuleNotFoundError` en `orders` y `payments`
-   **Causa:** Los archivos `orders/models.py` y `payments/models.py` usan importaciones relativas incorrectas para referenciar modelos de otras aplicaciones (ej: `from .products.models import Product`).
-   **Solución:** Cambiar estas importaciones para que sean absolutas desde la raíz del proyecto (ej: `from api.products.models import Product`).

### Error 5: `ImproperlyConfigured: URLconf ... does not appear to have any patterns in it`
-   **Causa:** Múltiples aplicaciones (`users`, `products`, etc.) tienen archivos `urls.py` completamente vacíos. Django requiere que estos archivos contengan, como mínimo, una lista llamada `urlpatterns`.
-   **Solución:** Añadir el código boilerplate `urlpatterns = []` a todos los archivos `urls.py` que estén vacíos.

### Error 6: `SystemCheckError: Reverse accessor for 'User.groups' clashes`
-   **Causa:** El proyecto define un modelo de Usuario personalizado pero no le indica a Django que lo utilice. Esto hace que Django cargue tanto el modelo por defecto como el personalizado, generando un conflicto.
-   **Solución:** Añadir la línea `AUTH_USER_MODEL = 'users.User'` al archivo `settings.py`.

### Error 7: `InconsistentMigrationHistory` (y otros errores de migración)
-   **Causa:** Este es el error final y más complejo, resultado de la acumulación de todos los problemas anteriores. La historia de las migraciones se vuelve irresoluble para Django. El sistema de migraciones se confunde incluso sin una base de datos existente.
-   **Solución (a aplicar DESPUÉS de arreglar todo lo anterior):** El procedimiento correcto es una "tierra quemada": borrar todos los archivos de migración generados en las subcarpetas `migrations/` (excepto `__init__.py`), y luego ejecutar `python manage.py makemigrations` seguido de `python manage.py migrate` para crear un historial limpio y consistente desde cero.

---

## 4. Plan de Acción Recomendado

Se recomienda encarecidamente que el equipo siga estos pasos en orden:

1.  **Sincronización del Equipo:** Revisar este documento en conjunto. La persona que ha estado trabajando en el backend ("la compañera") debe verificar si ya ha aplicado alguna de estas correcciones. El objetivo es fusionar el conocimiento y el trabajo para tener una única versión del código que será la base para las correcciones.

2.  **Aplicar Correcciones de Código:** Un miembro del equipo debe tomar la versión más actualizada del código y aplicar **todas las correcciones de código** detalladas en la sección anterior (puntos 1 al 6). Es crucial que se arreglen todos los archivos (`manage.py`, `settings.py`, `models.py`, `apps.py`, `urls.py`).

3.  **Hacer Commit y Push:** Subir todos estos cambios al repositorio de GitHub en la rama `main`.

4.  **Verificar el Despliegue en Render:** Observar el log de despliegue. Con los cambios anteriores, el build debería pasar la fase de instalación y llegar al paso `migrate`. Es probable que el comando `migrate` de Render todavía falle, pero esta vez los errores habrán sido superados.

5.  **Resolver Migraciones (Localmente):** Después de que el código esté arreglado en GitHub, un miembro del equipo debe:
    a. Clonar el repositorio actualizado en un entorno limpio.
    b. Seguir la **Solución del Error 7**: borrar los archivos de migración viejos, ejecutar `makemigrations` y luego `migrate` hasta que funcione localmente.
    c. Una vez que las migraciones funcionen localmente y se generen los nuevos archivos, hacer `commit` y `push` de estas nuevas migraciones al repositorio.

6.  **Éxito del Despliegue:** El siguiente despliegue en Render debería tomar el código y las migraciones correctas, y finalmente, el comando `migrate` debería tener éxito, dejando el backend operativo.

---

Este enfoque estructurado asegura que no se pierda trabajo y que el equipo solucione el problema de raíz de una manera ordenada y profesional.
