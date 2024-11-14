import 'package:get/get.dart';

class SplashRouteController extends GetxController {
  // 하나의 상태
  late bool finishAnimate = false;

  void setAnimationFinished() {
    finishAnimate = true;
    update();
  }
}
