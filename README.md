# Planet_explorer
Prueba Tecnica (Tres astronautas) : Una aplicación Flutter para explorar planetas utilizando Riverpod, go_router y arquitectura limpia.


# 🌍 Flutter Planet Explorer

Una aplicación Flutter responsiva que permite explorar planetas utilizando datos de una API REST pública. Implementa `Riverpod` para manejo de estado, `go_router` para navegación, y sigue una arquitectura limpia para facilitar su escalabilidad y mantenimiento.

## 🚀 Funcionalidades

- Página principal con acceso al explorador de planetas.
- Listado de planetas desde una API REST.
- Filtro en tiempo real por nombre, masa, distancia, etc.
- Vista detallada de cada planeta con datos completos e imagen.
- Gestión de favoritos almacenados localmente (usando `SharedPreferences`).
- Redirección automática en caso de error de ruta o planeta inexistente.
- Diseño responsivo para móviles, tablets y escritorio.

## 🧰 Tecnologías y paquetes usados

- `Flutter`
- `Flutter Riverpod` (estado)
- `go_router` (navegación declarativa)
- `Dio` (consumo de API)
- `SharedPreferences` (persistencia local)
- `ResponsiveBuilder` personalizado

## 🧱 Arquitectura

Organizada en una arquitectura limpia:

lib/
├── main.dart               # Punto de entrada de la app
├── core/                   # Utilidades generales (responsive, providers, tema, etc)
├── data/                   # Implementación de acceso a datos (APIs, repositorios)
├── domain/                 # Modelos y entidades del dominio (clases de negocio)
├── features/
│   └── planets/            # Módulo específico para la funcionalidad de Planetas
│       ├── application/    # Lógica de negocio, providers, controladores (Riverpod)
│       ├── domain/         # Entidades específicas de Planetas (si aplica)
│       └── presentation/   # Widgets, páginas y componentes UI relacionados a Planetas
├── router/                 # Configuración y definición de rutas con go_router
