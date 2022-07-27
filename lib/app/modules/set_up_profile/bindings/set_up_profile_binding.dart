import 'package:get/get.dart';

import '../controllers/set_up_profile_controller.dart';

class SetUpProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetUpProfileController>(
      () => SetUpProfileController(),
    );
  }
}
