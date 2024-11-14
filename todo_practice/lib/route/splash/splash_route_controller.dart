import 'package:get/get.dart';

class SplashRouteController extends GetxController {
  // 하나의 상태
  late bool finishAnimate = false;

  // text 애니메이션 끝났을때 상태 변화
  void animationFinished() {
    finishAnimate = true;
    update();
  }
}
