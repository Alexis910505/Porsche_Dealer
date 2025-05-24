import '../../domain/entities/part_entity.dart';
import '../../domain/repositories/part_repository.dart';

class PartRepositoryImpl implements PartRepository {
  final List<PartEntity> _parts = const [
    // Braking Systems
    PartEntity(
      id: 'pccb-911',
      name: 'PCCB Brake Kit',
      description:
          'Sistema de frenos de cerámica compuesta Porsche para mayor potencia de frenado y reducción de peso. Ideal para uso en pista y conducción deportiva.',
      price: 12999.99,
      category: 'Braking',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.suncoastparts.com/mm5/graphics/00000002/11/porsche%20macan%20ceramic%20brake%20kit%20upgrade%20pccb.jpg',
      stockQuantity: 15,
      specifications: {
        'Material': 'Cerámica Compuesta',
        'Reducción de Peso': '50% vs Acero',
        'Resistencia al Calor': 'Hasta 1000°C',
        'Garantía': '2 años',
      },
    ),
    PartEntity(
      id: 'pccb-taycan',
      name: 'PCCB Brake Kit - Taycan',
      description:
          'Sistema de frenos de alto rendimiento en cerámica diseñado específicamente para el Taycan. Ofrece una frenada potente y consistente incluso en condiciones extremas.',
      price: 14999.99,
      category: 'Braking',
      compatibleModel: 'Taycan Turbo',
      imageUrl:
          'https://www.taycanforum.com/forum/attachments/s-l1600-jpg.14482',
      stockQuantity: 10,
      specifications: {
        'Material': 'Cerámica Compuesta',
        'Reducción de Peso': '45% vs Acero',
        'Resistencia al Calor': 'Hasta 1000°C',
        'Garantía': '2 años',
      },
    ),

    // Exhaust Systems
    PartEntity(
      id: 'sport-exhaust-911',
      name: 'Sport Exhaust System',
      description:
          'Sistema de escape en titanio ultraligero con características de sonido ajustables. Mejora el rendimiento y ofrece un sonido deportivo distintivo.',
      price: 8999.99,
      category: 'Exhaust',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.hybrid-racing.com/cdn/shop/files/TCS5532BT_-_006_-_SQ.jpg?v=1707347197&width=1400',
      stockQuantity: 20,
      specifications: {
        'Material': 'Titanio',
        'Reducción de Peso': '30% vs Estándar',
        'Modos de Sonido': '3 modos',
        'Garantía': '2 años',
      },
    ),
    PartEntity(
      id: 'sport-exhaust-718',
      name: 'Sport Exhaust System - 718',
      description:
          'Sistema de escape deportivo con control de sonido dual. Optimiza el flujo de gases y mejora el rendimiento del motor.',
      price: 7999.99,
      category: 'Exhaust',
      compatibleModel: '718 GT4',
      imageUrl:
          'https://valvetronic.com/cdn/shop/files/3D181962-A405-4AAD-A9A0-A27AC2C54BFB.jpg?v=1740157831&width=1445',
      stockQuantity: 12,
      specifications: {
        'Material': 'Acero Inoxidable',
        'Reducción de Peso': '25% vs Estándar',
        'Modos de Sonido': '2 modos',
        'Garantía': '2 años',
      },
    ),

    // Wheels
    PartEntity(
      id: 'sport-classic-wheels',
      name: '21" Sport Classic Wheels',
      description:
          'Llantas de magnesio forjadas con diseño de bloqueo central. Combinan ligereza extrema con máxima resistencia y estilo clásico.',
      price: 12999.99,
      category: 'Wheels',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://cargym.com/cdn/shop/products/95B601025AC041_745x.jpg?v=1625748661',
      stockQuantity: 8,
      specifications: {
        'Material': 'Magnesio Forjado',
        'Tamaño': '21" x 9.5" Delantero, 21" x 12" Trasero',
        'Peso': '9.5kg Delantero, 10.2kg Trasero',
        'Garantía': '2 años',
      },
    ),
    PartEntity(
      id: 'turbo-wheels',
      name: '21" Turbo S Wheels',
      description:
          'Llantas de aluminio forjado optimizadas aerodinámicamente. Diseñadas para el Taycan Turbo S, ofrecen un equilibrio perfecto entre rendimiento y eficiencia.',
      price: 10999.99,
      category: 'Wheels',
      compatibleModel: 'Taycan Turbo',
      imageUrl:
          'https://www.elitecustomrims.com/cdn/shop/files/p5nfc3sqhxv4qhm403f04jod-large.png?v=1720079955',
      stockQuantity: 15,
      specifications: {
        'Material': 'Aluminio Forjado',
        'Tamaño': '21" x 9.5" Delantero, 21" x 11.5" Trasero',
        'Peso': '11.2kg Delantero, 12.1kg Trasero',
        'Garantía': '2 años',
      },
    ),

    // Suspension
    PartEntity(
      id: 'sport-suspension-911',
      name: 'Sport Suspension Kit',
      description:
          'Sistema de suspensión enfocado a pista con altura de marcha y amortiguación ajustables. Mejora significativamente el manejo y la estabilidad en curvas.',
      price: 7999.99,
      category: 'Suspension',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.vicrez.com/image/cache/catalog/products-vz/vicrez-performance-coilover-suspension-kit-1-1-1500x1500.jpg',
      stockQuantity: 10,
      specifications: {
        'Tipo': 'Doble Brazo',
        'Ajustabilidad': 'Altura, Amortiguación, Ángulo de Caída',
        'Reducción de Peso': '15% vs Estándar',
        'Garantía': '2 años',
      },
    ),
    PartEntity(
      id: 'sport-suspension-718',
      name: 'Sport Suspension Kit - 718',
      description:
          'Sistema de suspensión deportiva con ajustes personalizables. Optimiza el comportamiento dinámico para uso en carretera y pista.',
      price: 6999.99,
      category: 'Suspension',
      compatibleModel: '718 GT4',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRTj3vgYnBlK9htYwXEoXutNWQAVcjz3W8BA&s',
      stockQuantity: 8,
      specifications: {
        'Tipo': 'Doble Brazo',
        'Ajustabilidad': 'Altura, Amortiguación',
        'Reducción de Peso': '12% vs Estándar',
        'Garantía': '2 años',
      },
    ),

    // Aerodynamics
    PartEntity(
      id: 'aero-kit-911',
      name: 'Aerodynamic Kit',
      description:
          'Paquete aerodinámico completo que incluye splitter delantero, alerón trasero y difusor. Genera carga aerodinámica significativa para mayor estabilidad a altas velocidades.',
      price: 15999.99,
      category: 'Aerodynamics',
      compatibleModel: '911 GT3',
      imageUrl: 'https://assets.ecstuning.com/product_library/663652_x800.webp',
      stockQuantity: 5,
      specifications: {
        'Carga Aerodinámica': 'Hasta 860kg a 200km/h',
        'Reducción de Resistencia': '15% vs Estándar',
        'Material': 'Fibra de Carbono',
        'Garantía': '2 años',
      },
    ),
    PartEntity(
      id: 'aero-kit-718',
      name: 'Aerodynamic Kit - 718',
      description:
          'Paquete aerodinámico enfocado a pista para mayor carga aerodinámica. Mejora la estabilidad y el agarre en curvas de alta velocidad.',
      price: 13999.99,
      category: 'Aerodynamics',
      compatibleModel: '718 GT4',
      imageUrl:
          'https://www.design911.com/uploads/products/2560a2c1-0036-43f2-9e0a-46e9000b83dd/718GT4RSWBKIT_5.jpg',
      stockQuantity: 6,
      specifications: {
        'Carga Aerodinámica': 'Hasta 720kg a 200km/h',
        'Reducción de Resistencia': '12% vs Estándar',
        'Material': 'Fibra de Carbono',
        'Garantía': '2 años',
      },
    ),

    // Interior
    PartEntity(
      id: 'carbon-interior-911',
      name: 'Carbon Interior Package',
      description:
          'Paquete completo de revestimientos interiores en fibra de carbono. Añade un toque de exclusividad y ligereza al habitáculo.',
      price: 8999.99,
      category: 'Interior',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.mlperformanceusa.com/cdn/shop/products/1pO0heAckLcll3wuGcJNxuBWFcSnBG1nV.jpg?v=1699592734&width=1946',
      stockQuantity: 12,
      specifications: {
        'Componentes': 'Salpicadero, Paneles de Puertas, Consola Central',
        'Material': 'Fibra de Carbono',
        'Reducción de Peso': '8kg vs Estándar',
        'Garantía': '2 años',
      },
    ),
    PartEntity(
      id: 'sport-seats',
      name: 'Sport Bucket Seats',
      description:
          'Asientos deportivos tipo baquet en fibra de carbono con compatibilidad para arnés de 6 puntos. Ofrecen sujeción lateral excepcional y reducción de peso.',
      price: 6999.99,
      category: 'Interior',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.sparcousa.com/content/images/thumbs/0001244_qrt-r_550.jpeg',
      stockQuantity: 10,
      specifications: {
        'Material': 'Carcasa de Fibra de Carbono',
        'Peso': '12kg por asiento',
        'Características': 'Calefacción, Arnés de 6 puntos',
        'Garantía': '2 años',
      },
    ),
  ];

  PartRepositoryImpl();

  @override
  Future<List<PartEntity>> getAllParts() async {
    return _parts;
  }

  @override
  Future<List<PartEntity>> getPartsByCategory(String category) async {
    return _parts.where((part) => part.category == category).toList();
  }

  @override
  Future<List<PartEntity>> getPartsByModel(String model) async {
    return _parts.where((part) => part.compatibleModel == model).toList();
  }

  @override
  Future<PartEntity?> getPartById(String id) async {
    try {
      return _parts.firstWhere((part) => part.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<String>> getCategories() async {
    return _parts.map((part) => part.category).toSet().toList();
  }

  @override
  Future<List<String>> getCompatibleModels() async {
    return _parts.map((part) => part.compatibleModel).toSet().toList();
  }

  @override
  Future<void> updateStock(String partId, int quantity) async {
    final index = _parts.indexWhere((part) => part.id == partId);
    if (index != -1) {
      final part = _parts[index];
      final updatedPart = PartEntity(
        id: part.id,
        name: part.name,
        description: part.description,
        price: part.price,
        category: part.category,
        compatibleModel: part.compatibleModel,
        imageUrl: part.imageUrl,
        stockQuantity: part.stockQuantity + quantity,
        specifications: part.specifications,
      );
      _parts[index] = updatedPart;
    }
  }
}
