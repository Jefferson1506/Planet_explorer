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

- **main.dart**: Punto de entrada de la aplicación.  
- **core/**: Utilidades generales (responsive, providers, temas, etc.).  
- **data/**: Implementación de acceso a datos (APIs, repositorios).  
- **domain/**: Modelos y entidades del dominio (clases de negocio).  
- **features/planets/**: Funcionalidad específica de Planetas con su lógica, dominio y presentación.  
- **router/**: Configuración y definición de rutas usando go_router.
