# Products Demo

## Características del Proyecto

1. **Autenticación de Usuarios**
    - La aplicación permite a los usuarios crear cuentas y realizar inicio de sesión.
    - Utiliza Firebase Authentication para gestionar la autenticación de usuarios de manera segura.

2. **Visualización de Productos desde una API Pública**
    - Los usuarios autenticados pueden acceder a una lista de productos disponibles.
    - Los productos se obtienen de una API pública.
    - Los productos se muestran en una cuadrícula con imágenes, títulos, precios y descripciones.
    - La información de los productos se almacena localmente en la aplicación.

3. **Visualización de Ciudades desde Firestore**
    - La información de las ciudades se obtiene de Firebase Firestore, una base de datos en la nube de tiempo real.
    - Las ciudades se muestran en la aplicación.
    - La información de las ciudades se almacena y se actualiza en tiempo real en Firestore.

4. **Visualización de Datos de Usuario desde Firestore**
    - La información de los usuarios se almacena en Firebase Firestore.
    - Los datos de los usuarios, como la ciudad a la que pertenecen, se recuperan y se muestran en la aplicación.

5. **Internacionalización**
    - La aplicación está configurada para admitir múltiples idiomas a través de la librería `flutter_localizations`.
    - Los textos en la aplicación se pueden traducir y adaptar a diferentes idiomas según las preferencias del usuario.

6. **Cierre de Sesión**
    - Los usuarios pueden cerrar sesión en la aplicación de manera segura.

## Documentación

### Requisitos Previos

- Asegúrate de que Flutter y Dart estén instalados en tu entorno de desarrollo.
- Configura Firebase y Firestore en tu proyecto y proporciona el archivo de configuración adecuado.

### Ejecución de la Aplicación

- Ejecuta `flutter run` desde la raíz del proyecto para iniciar la aplicación en un emulador o dispositivo físico.
- Asegúrate de que el proyecto Flutter se ha inicializado correctamente.

## Estructura del Proyecto

El proyecto sigue una estructura organizada siguiendo las mejores prácticas de Flutter para mantener un código limpio y mantenible. A continuación, se describe la estructura de las carpetas y sus contenidos:

### Carpeta `lib`

- **`core`**: Contiene las funcionalidades y componentes centrales del proyecto que se utilizan en toda la aplicación.

    - **`enums.dart`**: Define enumeraciones utilizadas en la aplicación.
    
    - **`routes`**: Contiene archivos relacionados con la gestión de rutas de la aplicación.
    
        - **`page_generate.dart`**: Genera las rutas de navegación entre pantallas.
        
        - **`resource_images.dart`**: Almacena recursos gráficos, como imágenes.

    - **`services`**: Contiene archivos relacionados con servicios utilizados en la aplicación.
    
        - **`firestore_db.dart`**: Administra la interacción con Firebase Firestore para almacenar y recuperar datos.

    - **`theme`**: Almacena configuraciones relacionadas con la apariencia de la aplicación, como colores, fuentes, tamaños y el tema general.
    
    - **`widgets`**: Contiene componentes personalizados reutilizables, como botones y widgets de entrada de datos.

- **`features`**: Incluye módulos específicos de la aplicación, cada uno con su propia estructura.

    - **`authentication`**: Gestiona la autenticación de usuarios y consta de:
    
        - **`presentation`**: Contiene las pantallas de autenticación y sus componentes.
        
        - **`services`**: Almacena archivos relacionados con el servicio de autenticación.
        
        - **`utils`**: Incluye utilidades relacionadas con la autenticación.

    - **`city`**: Administra la visualización de ciudades y consta de:
    
        - **`data`**: Contiene los modelos de datos y los repositorios para gestionar la información de las ciudades.
        
        - **`presentation`**: Incluye la pantalla de ciudades y sus componentes.

    - **`init`**: Contiene la pantalla de inicio que se muestra al cargar la aplicación.

    - **`product`**: Maneja la visualización de productos y consta de:
    
        - **`data`**: Contiene los modelos de datos y los repositorios para gestionar la información de los productos.
        
        - **`presentation`**: Incluye la pantalla de productos y sus componentes, como la tarjeta de producto.

    - **`user`**: Gestiona la visualización de datos de usuario y consta de:
    
        - **`data`**: Contiene los modelos de datos y los repositorios para gestionar la información de los usuarios.
        
        - **`presentation`**: Incluye la pantalla de datos de usuario y sus componentes.

### Carpeta `assets`

Aquí se almacenan los recursos estáticos de la aplicación, como imágenes y archivos de traducción. Por ejemplo, las imágenes de productos se almacenan en la carpeta `assets/images`.

### Otros archivos

- **`firebase_options.dart`**: Configura las opciones de Firebase para la inicialización de la aplicación.

- **`generated/l10n.dart`**: Generado automáticamente, contiene las traducciones de la aplicación.

#### Firebase Firestore

La información de las ciudades se obtiene de Firebase Firestore, una base de datos en la nube de tiempo real proporcionada por Firebase. Firestore permite el almacenamiento y recuperación de datos en tiempo real, lo que garantiza que las ciudades se mantengan actualizadas y se puedan acceder en todo momento.

La información de los usuarios, como la ciudad a la que pertenecen, se almacena en Firestore. La autenticación de usuarios se gestiona mediante Firebase Authentication.

#### Flutter version: 3.7.5.
