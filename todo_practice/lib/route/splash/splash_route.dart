import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/route/list/list_route.dart';
import 'package:todo_practice/route/splash/splash_route_controller.dart';

class SplashRoute extends StatefulWidget {
  const SplashRoute({super.key});

  @override
  State<SplashRoute> createState() => _SplashRouteState();
}

class _SplashRouteState extends State<SplashRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;

  final SplashRouteController _splashRouteController =
      Get.put(SplashRouteController());

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    // 화면이 렌더링된 후 애니메이션 시작
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward(); // 애니메이션 실행
    });

    // 애니메이션 완료 후 페이지 이동
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _splashRouteController.setAnimationFinished();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashRouteController>(
      builder: (context) {
        // 애니메이션이 끝났을 때 페이지 이동
        if (_splashRouteController.finishAnimate) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.to(ListRoute()); // 애니메이션 완료 후 ListRoute로 이동
          });
          return Container(); // 페이지 이동 중 화면을 비우기 위해 빈 컨테이너 반환
        }
        return splashWidget();
      },
    );
  }

  Widget splashWidget() {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: const Text('TODO App'),
        ),
      ),
    );
  }
}
