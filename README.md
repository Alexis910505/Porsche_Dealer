# Porsche Dealer App

Aplicación móvil para la gestión y venta de partes y accesorios de Porsche.

## Características

- Catálogo de partes y accesorios para diferentes modelos de Porsche
- Filtrado por categorías y modelos compatibles
- Carrito de compras
- Gestión de inventario
- Detalles de productos con especificaciones técnicas
- Interfaz de usuario moderna y responsiva

## Tecnologías Utilizadas

- Flutter/Dart
- GetX para gestión de estado y navegación
- Arquitectura MVVM
- SharedPreferences para almacenamiento local
- Material Design 3

## Requisitos

- Flutter SDK (versión estable más reciente)
- Dart SDK
- Android Studio / VS Code
- Git

## Instalación

1. Clona el repositorio:
```bash
git clone https://github.com/Alexis910505/Porsche_Dealer.git
```

2. Navega al directorio del proyecto:
```bash
cd Porsche_Dealer
```

3. Instala las dependencias:
```bash
flutter pub get
```

4. Ejecuta la aplicación:
```bash
flutter run
```

## Estructura del Proyecto

```
lib/
├── app/
│   ├── core/
│   │   ├── styles/
│   │   └── theme/
│   ├── data/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   └── repositories/
│   └── presentation/
│       ├── mvvm/
│       │   ├── base/
│       │   ├── bindings/
│       │   ├── viewmodels/
│       │   └── views/
│       └── widgets/
└── main.dart
```

## Contribución

1. Haz un Fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Alexis - [@Alexis910505](https://github.com/Alexis910505)

Link del Proyecto: [https://github.com/Alexis910505/Porsche_Dealer](https://github.com/Alexis910505/Porsche_Dealer)
