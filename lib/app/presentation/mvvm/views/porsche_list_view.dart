import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/porsche_list_viewmodel.dart';
import '../../widgets/model_card.dart';
import '../../widgets/model_carousel.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/error_view.dart';

class PorscheListView extends StatelessWidget {
  const PorscheListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<PorscheListViewModel>();

    return Scaffold(
      body: Obx(() {
        if (viewModel.isLoading) {
          return const LoadingIndicator();
        }

        if (viewModel.hasError) {
          return ErrorView(
            message: viewModel.error,
            onRetry: viewModel.loadModels,
          );
        }

        return CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text(
                'ZWECK',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFFFAA502),
              floating: true,
              actions: [
                if (viewModel.categories.isNotEmpty)
                  PopupMenuButton<String>(
                    onSelected: viewModel.loadModelsByCategory,
                    itemBuilder: (context) => viewModel.categories
                        .map(
                          (category) => PopupMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.filter_list),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => Get.toNamed('/cart'),
                  tooltip: 'View cart',
                ),
              ],
            ),
            if (viewModel.hasModels) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ModelCarousel(models: viewModel.models),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final model = viewModel.models[index];
                    return ModelCard(
                      model: model,
                      onTap: () => viewModel.selectModel(model.id),
                    ).animate().fadeIn().scale();
                  }, childCount: viewModel.models.length),
                ),
              ),
            ] else
              const SliverFillRemaining(
                child: Center(child: Text('No models available')),
              ),
          ],
        );
      }),
    );
  }
}
