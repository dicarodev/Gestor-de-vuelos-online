# Plataforma de Gestión de Reservas de Vuelos

Este proyecto consiste en una plataforma web diseñada para facilitar la gestión de reservas de vuelos. Está dirigida a usuarios que deseen reservar y administrar sus vuelos de manera eficiente. A continuación se detallan los aspectos principales del negocio y los requisitos funcionales de la aplicación.

## Descripción del Negocio

Cada reserva de vuelo será realizada por un usuario registrado y puede incluir varios pasajes de diferentes vuelos. Los usuarios podrán reservar vuelos, ver su historial de reservas y administrar su perfil. Por otro lado, los administradores tendrán acceso para realizar mantenimiento y consultas sobre la información de vuelos y clientes almacenada.

## Requisitos Funcionales

### Funcionalidades para Usuarios No Identificados

1. Autorregistrarse como cliente.
2. Iniciar sesión.

### Funcionalidades para Usuarios Identificados (Clientes)

1. Consultar el catálogo de vuelos agrupado. Posibilidad de filtrar por origen, destino y fecha.
2. Realizar reservas de vuelos.
    - Agregar vuelo a la cesta.
    - Guardar la compra.
3. Consultar el histórico de reservas.

### Funcionalidades para Administradores

1. Consultar y mantener (CRUD) el catálogo de vuelos.
    - Consultar el catálogo de vuelos agrupado. Posibilidad de filtrar por origen, destino y fecha.
2. Consultar y mantener (CRUD) los usuarios clientes.
3. Consultar resumen ventas por usuario cliente especificado.
4. Consultar una venta especificada con sus detalles.

### Aspectos Clave del Diseño

1. **Validación de Campos**: Los campos de entrada estarán sujetos a validación para evitar errores y garantizar una experiencia fluida para el usuario.
   
2. **Valores por Defecto**: Se generarán automáticamente valores predeterminados cuando sea necesario, simplificando así el proceso de reserva de vuelos.

3. **Funcionalidades de Búsqueda y Ordenación**: Se incorporarán opciones para filtrar y ordenar los vuelos según criterios específicos, mejorando la eficiencia en la búsqueda de vuelos deseados.

4. **Interfaz de Usuario Intuitiva**: Interfaz diseñada de manera clara e intuitiva, priorizando la funcionalidad esperada y asegurando que los usuarios puedan navegar fácilmente para reservar y administrar sus vuelos.

## Tecnologías Utilizadas

- Desarrollado con Spring Core y Spring MVC.
- Servidor web Tomcat
- Imagen Oracle utilizada: `gvenzl/Oracle-xe:21-slim`.
- Versión JDK: 20.

## Instrucciones para Ejecutar la Aplicación

1. Clona el repositorio.
2. Asegúrate de tener configurada la versión de JDK 20.
3. Comenta las anotaciones mencionadas en las clases `SpringConfiguration` y `TaskController`.
   
   En la clase SpringConfiguration
   `//@Configuration`

   En la clase TaskController
   `//@Controller`
   `//@Autowired`
5. Ejecuta las clases `InitDefaultUsers` e `InitDefaultFlights` para cargar datos de prueba en la base de datos.
6. Descomenta las anotaciones mencionadas en las clases `SpringConfiguration` y `TaskController`.
7. Utiliza las siguientes credenciales para iniciar sesión:
    - **Administrador:**
        - Email: `diego@vuelaconmigo.es`
        - Contraseña: `toor`
    - **Cliente:**
        - Email: `ana.gonzalez@gmail.com`
        - Contraseña: `ana4567`

## Contribuciones

Las contribuciones son bienvenidas. Si encuentras algún problema o tienes alguna sugerencia para mejorar la aplicación, por favor, abre un problema o envía una solicitud de extracción.
