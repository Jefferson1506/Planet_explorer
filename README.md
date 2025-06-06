# 🌍 Planet Explorer

**Prueba Técnica (Tres Astronautas)**  
Una aplicación Flutter moderna para explorar planetas utilizando datos de una API REST pública. Desarrollada con `Riverpod`, `go_router` y siguiendo principios de arquitectura limpia para asegurar escalabilidad, mantenibilidad y modularidad.

---

## 🚀 Funcionalidades principales

- 🌌 Listado interactivo de planetas obtenidos desde una API REST.
- 🔍 Filtro dinámico por nombre, masa, distancia y otros parámetros.
- 🪐 Vista detallada de cada planeta con información completa e imágenes.
- ⭐ Gestión de favoritos almacenados localmente con `SharedPreferences`.
- ⚠️ Redirección automática en caso de rutas erróneas o planeta inexistente.
- 📱 Diseño completamente responsivo compatible con dispositivos móviles, tablets y escritorio.

---

## 🧰 Tecnologías y paquetes utilizados

| Propósito              | Paquete                          |
|------------------------|----------------------------------|
| Manejo de estado       | `flutter_riverpod`               |
| Navegación             | `go_router`                      |
| Consumo de API         | `dio`                            |
| Persistencia local     | `shared_preferences`             |
| Animaciones            | `lottie`, `animate_do`           |
| Carga y feedback       | `flutter_easyloading`            |
| UI y diseño            | `carousel_slider`, `cupertino_icons` |
| Responsive personalizado | Implementación propia           |

---

## 📁 Estructura del proyecto

La aplicación está organizada siguiendo los principios de arquitectura limpia:

## 🧱 Arquitectura

Organizada en una arquitectura limpia:

- **main.dart**: Punto de entrada de la aplicación.  
- **core/**: Utilidades generales (responsive, providers, temas, etc.).  
- **domain/**: Implementación de acceso a datos (APIs, repositorios).  
- **data/**: Modelos y entidades del dominio (clases de negocio).  
- **features/planets/**: Funcionalidad específica de Planetas con su lógica, dominio y presentación.  
- **router/**: Configuración y definición de rutas usando go_router.
- **shared/**: Componentes.



---

## 🛠️ Requisitos previos

- Flutter SDK ≥ 3.7.0
- Dart ≥ 3.x
- Android Studio o VS Code con Flutter extension

---

## ▶️ Pasos para ejecutar la app

1. **Clona este repositorio**:
   ```bash
   git clone https://github.com/tu_usuario/planet_explorer.git
   cd planet_explorer

flutter pub get

flutter run
