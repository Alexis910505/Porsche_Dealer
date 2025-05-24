import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  late final RxBool _isLoading;
  late final RxString _error;

  @override
  void onInit() {
    super.onInit();
    _isLoading = false.obs;
    _error = ''.obs;
  }

  bool get isLoading => _isLoading.value;
  String get error => _error.value;
  bool get hasError => _error.isNotEmpty;

  @protected
  void setLoading(bool value) {
    _isLoading.value = value;
  }

  @protected
  void setError(String message) {
    _error.value = message;
  }

  @protected
  void handleError(Object error) {
    setError(error.toString());
    if (Get.isDialogOpen == false &&
        Get.isSnackbarOpen == false &&
        Get.isBottomSheetOpen == false) {
      try {
        Get.snackbar(
          'Error',
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      } catch (e) {
        debugPrint('Error showing snackbar: $e');
      }
    }
  }

  @protected
  Future<T> withLoading<T>(Future<T> Function() action) async {
    try {
      setLoading(true);
      setError('');
      return await action();
    } catch (e) {
      handleError(e);
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
