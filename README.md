# Configuración del entorno de desarrollo local

## 1. Introducción
Esta configuración proporciona un entorno replicable que permite a los desarrolladores ejecutar la aplicación localmente, ejecutar tests unitarios, y validar nuevas características sin complicaciones.

## 2 Arquitectura de Software
A continuación daré una breve explicación de como esta estructurado nuestro entorno.

Básicamente el entorno está compuesto por 3 servicios gestionados en `docker-compose`:

1. **app** Contiene la aplicación y monta el codigo para evitar hacer build por cada cambio realizado.
2. **db_postgres (PostgresSQL)** Base de datos usada tanto el desarrollo como para las pruebas.
3. **test enviroment** Expone los resultados del reporte generado por los tests.
4. **Makefile** Para simplificar el uso de los comandos

### Tecnologias usadas.

- **Flask:** Framework web para Python.
- **PostgreSQL:** Base de datos relacional.
- **Docker Compose:** Orquestación de servicios para desarrollo local.
  
### Diagrama de la arquitectura
TODO


## 3. Inicializar entorno de desarrollo.

Primero se ha de clonar el repositorio.

```bash
git clone https://github.com/ander-Sgr/devops-project.git
```

Para levantar el entorno de desarrollo y la base de datos.

```bash
make run
```

> **_NOTE:_**  El servicio de la base de datos tiene un healthechek, no tardará mas de 10s en estar en UP.

## 4. Ejecución de los tests

### Paso 1 

Levanta el entorno de pruebas.

```bash
make tests
```

### Paso 2

Visualizar el reporte del coverage, te mostrará la URL.

```bash
make coverage
```

## 5. Parar los servicios y hacer un clean.

Lo que hará es borrarte los volumenes monstados que y la redes creadas por docker-compose.

```bash
make clean
```