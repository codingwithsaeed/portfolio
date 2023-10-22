import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/widgets/x_image.dart';
import 'package:portfolio/router.dart';
import 'package:x_framework/x_framework.dart';

import '../../assets.dart';

const splashUser =
    'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        context.goNamed(Routes.portfolio.name);
      });
    });
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 2),
          Column(
            children: [
              XAvatar(asset: Assets.me1, size: 0.2.sw),
            ],
          ),
          const Spacer(flex: 2),
          CircularProgressIndicator(color: context.onPrimaryColor, strokeWidth: 1.w, strokeCap: StrokeCap.round)
              .center(),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
