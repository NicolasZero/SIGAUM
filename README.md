# Monorepo del sistema de gestión de Actividaes y Unidades Móviles (SIGAUM)

## Contenido
1. [Introducción](#introduction)
2. [Instalación](#installation)
3. [API](#api)
4. [Endpoint](#endpoint)
5. [WEB](#web)

## Introducción <a name="introduction"></a>
Sistema web que sirve para registrar y gestionar las actividades, logros y unidades móviles por parte de los trabajadores tanto internos como externos del instituto de la mujer (INAMUJER) con la finalidad de llevar un control y registro sobre las actividades realizadas y las planeadas a futuro y la entrega de espacios y/o suministros para la realización de dicha actividad o unidad móvil

## Instalación <a name="installation"></a>
Para instalar y ejecutar este proyecto en tu máquina local, sigue estos pasos:

### Requisitos
- Node.js (versión 20 o superior)
- pnpm (versión 8 o superior)
- postgreSQL (versión 15 o superior)

### 1.- Clonar el Repositorio
```bash
git clone <URL_DEL_REPOSITORIO>
cd SIGAUM
```

### 2.- Instalar Dependencias

```bash
pnpm i
```

### 3.- Crear base de datos
Dentro de la carpeta db, que se encuentra en la carpeta raíz, están los archivos .sql para la creacion de las tablas para una base de datos Postgre.

El orden de ejecución de los archivos es:
1. create_db
2. create_view
3. inser_necessary_data
4. inser_test_data (para pruebas)

### 4.- Configurar las variables de entorno (ENV)
Hay dos archivos .env.example para que puedas configurar la base de datos y agregar el host del sistema que usa la api.

Se encuentran en:
1. apps/web/.env.example
2. apps/api/.env.example

Puedes cambiar los nombres de los archivos a ".env" y modificarlos. 

### Scripts Disponibles ###
```bash
// Inicia la aplicación en modo de desarrollo.
pnpm dev

// Construye la aplicación para producción
pnpm build

// Iniciar el servidor para producción
pnpm start

// Puedes especificar api o web con:
pnpm dev:api

pnpm dev:web

// Tambien sirve con start. 
// Build se mantiene igual
```

## Api del sistema <a name="api"></a>
La api del sistema esta realizada con **Fastify** usando **JS** Puro y **NodeJs**. Es importante aclarar que la Api solo se puede conectar a Base de Datos de **PostgreSQL** porque no se ha utilizado algún ORM.

### Estructura de archivos
Dentro de la carpeta  apps/api/src se encuentran las siguientes carpetas.

- **controllers**: Aquí están los controladores, es decir, la lógica que procesa los datos solicitados y los que se envian.
- **db**: Aqui hay las configuraciones y funciones que se conecta a la BD.
- **helpres**: Aquí se guardan Las funciones genericas y repetitivas que se usan en varios archivos.
- **routes**: Aquí estan los endpoints que tiene la api

## Endpoints <a name="endpoint"></a>
En la carpeta api/src/route estan las rutas (endpoints) de la api. Manteniendo el nombre del archivo para la ruta. Ejemplo:

host:[port]/age_range

Es importante revisar cada archivo para saber que metodod http utiliza cada ruta.

#### Definicion de los metodos http ####
La api utiliza los siguientes metodos HTTP de la siguiente manera:

- GET: Unicamente para solicitud de datos
- POST: Unicamente para insertar/crear datos nuevos
- PUT: Unicamente para actualizar registros (una o más columnas)
- PATH: Unicamente para actualizar un solo dato de un registro especifico.

## WEB del sistema <a name="web"></a>
La interfaz del sistema está realizada en **Next** utilizando **Typescripts** y para el diseño se utilizó **Shadcn UI**.

### Tecnologías Utilizadas

- **Next.js**: Framework de React para aplicaciones web.
- **React**: Biblioteca de JavaScript para construir interfaces de usuario.
- **Tailwind CSS**: Framework de CSS para diseño rápido.
- **Radix UI**: Componentes accesibles y sin estilo para React.
- **TanStack React Query**: Librería para el manejo de datos en React.
- **Axios**: Cliente HTTP basado en promesas.
- **Framer Motion**: Librería para animaciones en React.
- **Lucide React**: Iconos para React.
- **HTML2Canvas**: Captura de pantallas en el navegador.
- **jsPDF**: Generación de archivos PDF.
- **Zod**: Validación de esquemas.
- **Sharp**: Procesamiento de imágenes.
- **XLSX**: Manipulación de archivos Excel.
- **ESLint**: Herramienta de análisis estático para encontrar problemas en el código JavaScript.
- **TypeScript**: Superset de JavaScript que añade tipos estáticos.