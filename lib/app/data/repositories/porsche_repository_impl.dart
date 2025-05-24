import '../../domain/entities/porsche_model.dart';
import '../../domain/repositories/porsche_repository.dart';
import '../models/porsche_model.dart';

class PorscheRepositoryImpl implements PorscheRepository {
  @override
  Future<List<PorscheModelEntity>> getModels() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    return const [
      PorscheModel(
        id: '911',
        name: 'Porsche 911 GT3 RS',
        description:
            'The 911 GT3 RS is the most extreme version of the 911, designed for the track but street legal. With 525 horsepower and aggressive aerodynamics, it\'s a race car for the street.',
        imageUrl:
            'https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-modelimage-sideshot/model/765dfc51-51bc-11ed-80f5-005056bbdc38/porsche-model.png',
        galleryImages: [
          'https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-exterior-01/model/765dfc51-51bc-11ed-80f5-005056bbdc38/porsche-model.png',
          'https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-exterior-02/model/765dfc51-51bc-11ed-80f5-005056bbdc38/porsche-model.png',
          'https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-exterior-03/model/765dfc51-51bc-11ed-80f5-005056bbdc38/porsche-model.png',
          'https://files.porsche.com/filestore/image/multimedia/none/992-gt3-rs-interior-01/model/765dfc51-51bc-11ed-80f5-005056bbdc38/porsche-model.png',
        ],
        category: 'Sports',
        price: 241300.00,
        specifications: {
          'Engine': '4.0L Boxer 6',
          'Power': '525 hp',
          'Torque': '343 lb-ft',
          '0-60 mph': '2.8 s',
          'Top Speed': '184 mph',
          'Weight': '3,197 lbs',
        },
        features: [
          'Active aerodynamics',
          'Double wishbone suspension',
          'Ceramic PCCB brakes',
          '7-speed PDK transmission',
          'Track mode',
        ],
      ),
      PorscheModel(
        id: 'taycan',
        name: 'Porsche Taycan Turbo S',
        description:
            'The Taycan Turbo S is Porsche\'s most powerful electric vehicle, combining legendary Porsche performance with future technology. With 761 horsepower, it redefines what\'s possible in an electric vehicle.',
        imageUrl:
            'https://images-porsche.imgix.net/-/media/329E707A3234485BBE98485116865780_E8DD4C47C7F14D41B61C1AE76B59FC1A_TA24Q3EIX0010-taycan-turbo-s-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        galleryImages: [
          'https://images-porsche.imgix.net/-/media/329E707A3234485BBE98485116865780_E8DD4C47C7F14D41B61C1AE76B59FC1A_TA24Q3EIX0010-taycan-turbo-s-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/329E707A3234485BBE98485116865780_E8DD4C47C7F14D41B61C1AE76B59FC1A_TA24Q3EIX0010-taycan-turbo-s-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/329E707A3234485BBE98485116865780_E8DD4C47C7F14D41B61C1AE76B59FC1A_TA24Q3EIX0010-taycan-turbo-s-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/329E707A3234485BBE98485116865780_E8DD4C47C7F14D41B61C1AE76B59FC1A_TA24Q3EIX0010-taycan-turbo-s-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        ],
        category: 'Electric',
        price: 190900.00,
        specifications: {
          'Engine': 'Dual Electric Motor',
          'Power': '761 hp',
          'Torque': '774 lb-ft',
          '0-60 mph': '2.6 s',
          'Top Speed': '162 mph',
          'Range': '301 miles',
        },
        features: [
          '800V charging system',
          'Air suspension',
          'Regenerative braking',
          'Range mode',
          'Porsche Electric Sport Sound system',
        ],
      ),
      PorscheModel(
        id: 'cayenne',
        name: 'Porsche Cayenne Turbo GT',
        description:
            'The Cayenne Turbo GT is Porsche\'s most powerful SUV, combining the versatility of an SUV with supercar performance. With 640 horsepower, it sets new standards in its segment.',
        imageUrl:
            'https://images-porsche.imgix.net/-/media/B9F83D6A88A34055AB8C8F9A78C94F21_D947E52D696C4A37B3C68A74C9EF5909_MCY24J5SIX0010-cayenne-turbo-gt-side?w=2560&h=811&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        galleryImages: [
          'https://images-porsche.imgix.net/-/media/B9F83D6A88A34055AB8C8F9A78C94F21_D947E52D696C4A37B3C68A74C9EF5909_MCY24J5SIX0010-cayenne-turbo-gt-side?w=2560&h=811&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/B9F83D6A88A34055AB8C8F9A78C94F21_D947E52D696C4A37B3C68A74C9EF5909_MCY24J5SIX0010-cayenne-turbo-gt-side?w=2560&h=811&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/B9F83D6A88A34055AB8C8F9A78C94F21_D947E52D696C4A37B3C68A74C9EF5909_MCY24J5SIX0010-cayenne-turbo-gt-side?w=2560&h=811&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/B9F83D6A88A34055AB8C8F9A78C94F21_D947E52D696C4A37B3C68A74C9EF5909_MCY24J5SIX0010-cayenne-turbo-gt-side?w=2560&h=811&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        ],
        category: 'SUV',
        price: 180800.00,
        specifications: {
          'Engine': '4.0L V8 Biturbo',
          'Power': '640 hp',
          'Torque': '627 lb-ft',
          '0-60 mph': '3.1 s',
          'Top Speed': '186 mph',
          'Weight': '5,170 lbs',
        },
        features: [
          'Adaptive air suspension',
          'Sport exhaust system',
          'Ceramic PCCB brakes',
          'Sport Plus mode',
          'Porsche Traction Management system',
        ],
      ),
      PorscheModel(
        id: '718',
        name: 'Porsche 718 Cayman GT4 RS',
        description:
            'The 718 Cayman GT4 RS is the most extreme version of the Cayman, with a 4.0L naturally aspirated engine producing 493 horsepower. Its aerodynamic design and optimized chassis make it a pure driving machine.',
        imageUrl:
            'https://images-porsche.imgix.net/-/media/C4482DD3FACC491C867964A32CB2195C_DA2479EB3263431C95E32D1234616D02_CM24N3JIX0001-718-cayman-gt-4-rs-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        galleryImages: [
          'https://images-porsche.imgix.net/-/media/C4482DD3FACC491C867964A32CB2195C_DA2479EB3263431C95E32D1234616D02_CM24N3JIX0001-718-cayman-gt-4-rs-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/C4482DD3FACC491C867964A32CB2195C_DA2479EB3263431C95E32D1234616D02_CM24N3JIX0001-718-cayman-gt-4-rs-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/C4482DD3FACC491C867964A32CB2195C_DA2479EB3263431C95E32D1234616D02_CM24N3JIX0001-718-cayman-gt-4-rs-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/C4482DD3FACC491C867964A32CB2195C_DA2479EB3263431C95E32D1234616D02_CM24N3JIX0001-718-cayman-gt-4-rs-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        ],
        category: 'Sports',
        price: 141700.00,
        specifications: {
          'Engine': '4.0L Boxer 6',
          'Power': '493 hp',
          'Torque': '331 lb-ft',
          '0-60 mph': '3.2 s',
          'Top Speed': '196 mph',
          'Weight': '3,119 lbs',
        },
        features: [
          'Optimized aerodynamics',
          'Sport suspension',
          'Ceramic PCCB brakes',
          '6-speed manual transmission',
          'Track mode',
        ],
      ),
      PorscheModel(
        id: 'panamera',
        name: 'Porsche Panamera Turbo S',
        description:
            'The Panamera Turbo S is Porsche\'s most powerful sedan, combining luxury and performance in an exceptional package. With 630 horsepower, it offers a unique driving experience in its segment.',
        imageUrl:
            'https://images-porsche.imgix.net/-/media/40C6ABF917A34AE0B94C7726C3D0DBC7_CE02CFD7B0F844E8B5142D694A5A7E89_panamera-gts-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        galleryImages: [
          'https://images-porsche.imgix.net/-/media/40C6ABF917A34AE0B94C7726C3D0DBC7_CE02CFD7B0F844E8B5142D694A5A7E89_panamera-gts-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/40C6ABF917A34AE0B94C7726C3D0DBC7_CE02CFD7B0F844E8B5142D694A5A7E89_panamera-gts-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/40C6ABF917A34AE0B94C7726C3D0DBC7_CE02CFD7B0F844E8B5142D694A5A7E89_panamera-gts-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
          'https://images-porsche.imgix.net/-/media/40C6ABF917A34AE0B94C7726C3D0DBC7_CE02CFD7B0F844E8B5142D694A5A7E89_panamera-gts-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format',
        ],
        category: 'Sedan',
        price: 195000.00,
        specifications: {
          'Engine': '4.0L V8 Biturbo',
          'Power': '630 hp',
          'Torque': '604 lb-ft',
          '0-60 mph': '2.9 s',
          'Top Speed': '196 mph',
          'Weight': '4,564 lbs',
        },
        features: [
          'Adaptive air suspension',
          'Sport exhaust system',
          'Ceramic PCCB brakes',
          '8-speed PDK transmission',
          'Sport Plus mode',
        ],
      ),
    ];
  }

  @override
  Future<List<PorscheModelEntity>> getModelsByCategory(String category) async {
    final models = await getModels();
    return models.where((model) => model.category == category).toList();
  }

  @override
  Future<PorscheModelEntity?> getModelById(String id) async {
    final models = await getModels();
    try {
      return models.firstWhere((model) => model.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<String>> getCategories() async {
    final models = await getModels();
    return models.map((model) => model.category).toSet().toList();
  }
}
