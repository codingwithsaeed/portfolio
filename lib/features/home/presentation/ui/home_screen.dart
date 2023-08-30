import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';
import 'package:portfolio/core/extensions.dart';
import 'package:portfolio/core/widgets/x_image.dart';

class HomeServiceModel {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? titleColor;
  final VoidCallback? onTap;

  HomeServiceModel({
    required this.title,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.titleColor,
    this.onTap,
  });
}

List<HomeServiceModel> services = [
  HomeServiceModel(
    title: 'About Me',
    icon: Icons.person,
    onTap: () {},
  ),
  HomeServiceModel(
    title: 'Skills',
    icon: Icons.code_rounded,
    onTap: () {},
  ),
  HomeServiceModel(
    title: 'Projects',
    icon: Icons.work,
    onTap: () {},
  ),
  HomeServiceModel(
    title: 'Contact',
    icon: Icons.phone_android_rounded,
    onTap: () {},
  ),
];

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        XAvatar(asset: Assets.me1, size: 0.3.sw),
        SizedBox(height: 16.w),
        Text('Saeed Ahmadi', style: context.titleSmall.copyWith(fontSize: 14.sp)),
        SizedBox(height: 4.h),
        Text('Software Engineer | App Developer',
            style: context.titleSmall.copyWith(color: context.tertiary, fontSize: 12.sp)),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, Screen screen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 2),
        _buildImage(context),
        const Spacer(),
        _buildServices(context, screen),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildTablet(BuildContext context, Screen screen) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(child: _buildImage(context).center()).expand(),
        Container(child: _buildServices(context, screen).center()).expand()
      ],
    );
  }

  Widget _buildHandset(BuildContext context, Screen screen) {
    return _buildDesktop(context, screen);
  }

  Widget _buildServices(BuildContext context, Screen screen) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      separatorBuilder: (context, index) => SizedBox(height: 16.w),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final service = services[index];
        return InkWell(
          radius: 12,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.primary.withOpacity(0.02),
                  )
                ],
                // color: context.primary.withOpacity(0.2),
                //border: Border.all(color: context.primary.withOpacity(0.4), width: 1.0),
                gradient: LinearGradient(
                  tileMode: TileMode.decal,
                  colors: [
                    context.onPrimary.withOpacity(0.3),
                    context.onPrimary.withOpacity(0.15),
                    context.onPrimary.withOpacity(0.01),
                    context.onPrimary.withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.4, 0.85, 1.0],
                ),
                borderRadius: BorderRadius.circular(12)),
            //color: service.backgroundColor ?? context.tertiary,
            child: ListTile(
              style: ListTileStyle.list,
              horizontalTitleGap: 0,
              hoverColor: context.primary,
              splashColor: context.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text(service.title,
                  style: context.titleSmall.copyWith(color: service.titleColor ?? context.primary, fontSize: 12.sp)),
              leading: Icon(service.icon, color: service.iconColor ?? context.primary),
              onTap: service.onTap,
            ),
          ),
        );
      },
      itemCount: services.length,
    );
  }
}
