import '../../domain/entities/part_entity.dart';
import '../../domain/repositories/part_repository.dart';

class PartRepositoryImpl implements PartRepository {
  final List<PartEntity> _parts = const [
    // Braking Systems
    PartEntity(
      id: 'pccb-911',
      name: 'PCCB Brake Kit',
      description:
          'Porsche Ceramic Composite Brake system for increased braking power and weight reduction. Ideal for track use and sport driving.',
      price: 12999.99,
      category: 'Braking',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.suncoastparts.com/mm5/graphics/00000002/11/porsche%20macan%20ceramic%20brake%20kit%20upgrade%20pccb.jpg',
      stockQuantity: 15,
      specifications: {
        'Material': 'Ceramic Composite',
        'Weight Reduction': '50% vs Steel',
        'Heat Resistance': 'Up to 1000°C',
        'Warranty': '2 years',
      },
    ),
    PartEntity(
      id: 'pccb-taycan',
      name: 'PCCB Brake Kit - Taycan',
      description:
          'High-performance ceramic brake system specifically designed for the Taycan. Provides powerful and consistent braking even in extreme conditions.',
      price: 14999.99,
      category: 'Braking',
      compatibleModel: 'Taycan Turbo',
      imageUrl:
          'https://www.taycanforum.com/forum/attachments/s-l1600-jpg.14482',
      stockQuantity: 10,
      specifications: {
        'Material': 'Ceramic Composite',
        'Weight Reduction': '45% vs Steel',
        'Heat Resistance': 'Up to 1000°C',
        'Warranty': '2 years',
      },
    ),

    // Exhaust Systems
    PartEntity(
      id: 'sport-exhaust-911',
      name: 'Sport Exhaust System',
      description:
          'Ultra-lightweight titanium exhaust system with adjustable sound characteristics. Improves performance and delivers a distinctive sport sound.',
      price: 8999.99,
      category: 'Exhaust',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.hybrid-racing.com/cdn/shop/files/TCS5532BT_-_006_-_SQ.jpg?v=1707347197&width=1400',
      stockQuantity: 20,
      specifications: {
        'Material': 'Titanium',
        'Weight Reduction': '30% vs Standard',
        'Sound Modes': '3 modes',
        'Warranty': '2 years',
      },
    ),
    PartEntity(
      id: 'sport-exhaust-718',
      name: 'Sport Exhaust System - 718',
      description:
          'Sport exhaust system with dual sound control. Optimizes gas flow and improves engine performance.',
      price: 7999.99,
      category: 'Exhaust',
      compatibleModel: '718 GT4',
      imageUrl:
          'https://valvetronic.com/cdn/shop/files/3D181962-A405-4AAD-A9A0-A27AC2C54BFB.jpg?v=1740157831&width=1445',
      stockQuantity: 12,
      specifications: {
        'Material': 'Stainless Steel',
        'Weight Reduction': '25% vs Standard',
        'Sound Modes': '2 modes',
        'Warranty': '2 years',
      },
    ),

    // Wheels
    PartEntity(
      id: 'sport-classic-wheels',
      name: '21" Sport Classic Wheels',
      description:
          'Forged magnesium wheels with center-lock design. Combines extreme lightness with maximum strength and classic style.',
      price: 12999.99,
      category: 'Wheels',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://cargym.com/cdn/shop/products/95B601025AC041_745x.jpg?v=1625748661',
      stockQuantity: 8,
      specifications: {
        'Material': 'Forged Magnesium',
        'Size': '21" x 9.5" Front, 21" x 12" Rear',
        'Weight': '9.5kg Front, 10.2kg Rear',
        'Warranty': '2 years',
      },
    ),
    PartEntity(
      id: 'turbo-wheels',
      name: '21" Turbo S Wheels',
      description:
          'Aerodynamically optimized forged aluminum wheels. Designed for the Taycan Turbo S, offering perfect balance between performance and efficiency.',
      price: 10999.99,
      category: 'Wheels',
      compatibleModel: 'Taycan Turbo',
      imageUrl:
          'https://www.elitecustomrims.com/cdn/shop/files/p5nfc3sqhxv4qhm403f04jod-large.png?v=1720079955',
      stockQuantity: 15,
      specifications: {
        'Material': 'Forged Aluminum',
        'Size': '21" x 9.5" Front, 21" x 11.5" Rear',
        'Weight': '11.2kg Front, 12.1kg Rear',
        'Warranty': '2 years',
      },
    ),

    // Suspension
    PartEntity(
      id: 'sport-suspension-911',
      name: 'Sport Suspension Kit',
      description:
          'Track-focused suspension system with adjustable ride height and damping. Significantly improves handling and stability in corners.',
      price: 7999.99,
      category: 'Suspension',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.vicrez.com/image/cache/catalog/products-vz/vicrez-performance-coilover-suspension-kit-1-1-1500x1500.jpg',
      stockQuantity: 10,
      specifications: {
        'Type': 'Double Wishbone',
        'Adjustability': 'Height, Damping, Camber Angle',
        'Weight Reduction': '15% vs Standard',
        'Warranty': '2 years',
      },
    ),
    PartEntity(
      id: 'sport-suspension-718',
      name: 'Sport Suspension Kit - 718',
      description:
          'Sport suspension system with customizable settings. Optimizes dynamic behavior for both road and track use.',
      price: 6999.99,
      category: 'Suspension',
      compatibleModel: '718 GT4',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRTj3vgYnBlK9htYwXEoXutNWQAVcjz3W8BA&s',
      stockQuantity: 8,
      specifications: {
        'Type': 'Double Wishbone',
        'Adjustability': 'Height, Damping',
        'Weight Reduction': '12% vs Standard',
        'Warranty': '2 years',
      },
    ),

    // Aerodynamics
    PartEntity(
      id: 'aero-kit-911',
      name: 'Aerodynamic Kit',
      description:
          'Complete aerodynamic package including front splitter, rear wing, and diffuser. Generates significant downforce for increased stability at high speeds.',
      price: 15999.99,
      category: 'Aerodynamics',
      compatibleModel: '911 GT3',
      imageUrl: 'https://assets.ecstuning.com/product_library/663652_x800.webp',
      stockQuantity: 5,
      specifications: {
        'Downforce': 'Up to 860kg at 200km/h',
        'Drag Reduction': '15% vs Standard',
        'Material': 'Carbon Fiber',
        'Warranty': '2 years',
      },
    ),
    PartEntity(
      id: 'aero-kit-718',
      name: 'Aerodynamic Kit - 718',
      description:
          'Track-focused aerodynamic package for increased downforce. Improves stability and grip in high-speed corners.',
      price: 13999.99,
      category: 'Aerodynamics',
      compatibleModel: '718 GT4',
      imageUrl:
          'https://www.design911.com/uploads/products/2560a2c1-0036-43f2-9e0a-46e9000b83dd/718GT4RSWBKIT_5.jpg',
      stockQuantity: 6,
      specifications: {
        'Downforce': 'Up to 720kg at 200km/h',
        'Drag Reduction': '12% vs Standard',
        'Material': 'Carbon Fiber',
        'Warranty': '2 years',
      },
    ),

    // Interior
    PartEntity(
      id: 'carbon-interior-911',
      name: 'Carbon Interior Package',
      description:
          'Complete interior trim package in carbon fiber. Adds a touch of exclusivity and lightness to the cabin.',
      price: 8999.99,
      category: 'Interior',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.mlperformanceusa.com/cdn/shop/products/1pO0heAckLcll3wuGcJNxuBWFcSnBG1nV.jpg?v=1699592734&width=1946',
      stockQuantity: 12,
      specifications: {
        'Components': 'Dashboard, Door Panels, Center Console',
        'Material': 'Carbon Fiber',
        'Weight Reduction': '8kg vs Standard',
        'Warranty': '2 years',
      },
    ),
    PartEntity(
      id: 'sport-seats',
      name: 'Sport Bucket Seats',
      description:
          'Carbon fiber sport bucket seats with 6-point harness compatibility. Offers exceptional lateral support and weight reduction.',
      price: 6999.99,
      category: 'Interior',
      compatibleModel: '911 GT3',
      imageUrl:
          'https://www.sparcousa.com/content/images/thumbs/0001244_qrt-r_550.jpeg',
      stockQuantity: 10,
      specifications: {
        'Material': 'Carbon Fiber Shell',
        'Weight': '12kg per seat',
        'Features': 'Heating, 6-point Harness',
        'Warranty': '2 years',
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
