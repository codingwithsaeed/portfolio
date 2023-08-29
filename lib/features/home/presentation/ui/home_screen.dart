import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';
import 'package:portfolio/core/extensions.dart';
import 'package:portfolio/core/widgets/x_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveBuilder(
        defaultBuilder: (context, screen) => _buildDesktop(context, screen),
        layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
          desktop: (context, screen) => _buildDesktop(context, screen),
          tablet: (context, screen) => _buildTablet(context, screen),
          handset: (context, screen) => _buildHandset(context, screen),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Column(
      children: [
        XAvatar(asset: Assets.me1, size: 0.2.sw),
        const SizedBox(height: 16),
        Text('Saeed Ahmadi', style: context.titleSmall.copyWith(fontSize: 16.sp)),
        Text('Software Engineer | App Developer',
            style: context.titleSmall.copyWith(color: context.tertiary, fontSize: 14.sp)),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, Screen screen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 2),
        _buildImage(context),
        const Spacer(flex: 2),
        _buildServices(context, screen),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildTablet(BuildContext context, Screen screen) {
    return _buildDesktop(context, screen);
  }

  Widget _buildHandset(BuildContext context, Screen screen) {
    return _buildDesktop(context, screen);
  }

  Widget _buildServices(BuildContext context, Screen screen) {
    return SizedBox(
      height: 0.2.sh,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(width: 16.w),
        Container(
          decoration: BoxDecoration(
            color: context.tertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(height: 0.2.sh),
        ).expand(),
        SizedBox(width: 16.w),
        Container(
          decoration: BoxDecoration(
            color: context.tertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(height: 0.2.sh),
        ).expand(),
        SizedBox(width: 16.w),
        Container(
          decoration: BoxDecoration(
            color: context.tertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(height: 0.2.sh),
        ).expand(),
        SizedBox(width: 16.w),
        Container(
          decoration: BoxDecoration(
            color: context.tertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(height: 0.2.sh),
        ).expand(),
        SizedBox(width: 16.w),
      ]),
    );
  }
}
