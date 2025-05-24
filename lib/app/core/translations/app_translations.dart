import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'es_ES': {
      // General
      'app_name': 'Zweck',
      'error': 'Error',
      'loading': 'Cargando...',

      // Botones
      'share': 'Compartir',
      'add_to_favorites': 'Agregar a favoritos',
      'remove_from_favorites': 'Quitar de favoritos',

      // Mensajes
      'share_error': 'No se pudo compartir el modelo',
      'model_not_found': 'No se encontró el modelo seleccionado',
      'model_data_error': 'El modelo no tiene todos los datos necesarios',
      'image_load_error': 'Error al cargar la imagen',

      // Categorías
      'category_sports': 'Deportivos',
      'category_suv': 'SUV',
      'category_electric': 'Eléctricos',
      'category_sedan': 'Sedán',

      // Especificaciones
      'specifications': 'Especificaciones',
      'power': 'Potencia',
      'torque': 'Torque',
      'acceleration': 'Aceleración 0-100 km/h',
      'top_speed': 'Velocidad máxima',
      'weight': 'Peso',
      'transmission': 'Transmisión',
      'drivetrain': 'Tracción',
      'fuel_consumption': 'Consumo de combustible',
      'electric_range': 'Autonomía eléctrica',
      'battery_capacity': 'Capacidad de batería',

      // Compartir
      'share_title': '¡Mira este increíble @name!',
      'share_description':
          '@description\n\nEspecificaciones:\n@specs\n\nDescubre más en Zweck.',
    },
    'en_US': {
      // General
      'app_name': 'Zweck',
      'error': 'Error',
      'loading': 'Loading...',

      // Buttons
      'share': 'Share',
      'add_to_favorites': 'Add to favorites',
      'remove_from_favorites': 'Remove from favorites',

      // Messages
      'share_error': 'Could not share the model',
      'model_not_found': 'Selected model not found',
      'model_data_error': 'The model does not have all required data',
      'image_load_error': 'Error loading image',

      // Categories
      'category_sports': 'Sports',
      'category_suv': 'SUV',
      'category_electric': 'Electric',
      'category_sedan': 'Sedan',

      // Specifications
      'specifications': 'Specifications',
      'power': 'Power',
      'torque': 'Torque',
      'acceleration': 'Acceleration 0-100 km/h',
      'top_speed': 'Top Speed',
      'weight': 'Weight',
      'transmission': 'Transmission',
      'drivetrain': 'Drivetrain',
      'fuel_consumption': 'Fuel Consumption',
      'electric_range': 'Electric Range',
      'battery_capacity': 'Battery Capacity',

      // Share
      'share_title': 'Check out this amazing @name!',
      'share_description':
          '@description\n\nSpecifications:\n@specs\n\nDiscover more at Zweck.',
    },
  };
}
