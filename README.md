# Monorepo del sistema de gestión de Actividaes y Unidades Móviles (SIGAUM)

## Contenido
1. [Introducción](#introduction)
2. [Instalación](#installation)
3. [API](#api)
4. [WEB](#web)
5. [Añadir features](#feature)

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
4. inser_test_data
 

### Scripts Disponibles
```bash
// Inicia la aplicación en modo de desarrollo.
pnpm dev

// Construye la aplicación para producción
pnpm build

// Iniciar el servidor
pnpm start
```

## Api del sistema <a name="api"></a>



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


## Agregar nuevas features al proyecto: <a name="feature"></a>

1. Haz un fork(clonar) del proyecto.
2. Crea una nueva rama (git checkout -b feature/nueva-funcionalidad).
3. Realiza tus cambios y haz commit (git commit -am 'Añadir nueva funcionalidad').
4. Haz push a la rama (git push origin feature/nueva-funcionalidad).
5. Abre un Pull Request.
