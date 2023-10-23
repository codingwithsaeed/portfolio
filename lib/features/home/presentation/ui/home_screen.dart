import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:portfolio/assets.dart';
import 'package:portfolio/core/dimens.dart';
import 'package:portfolio/core/extensions.dart';
import 'package:portfolio/core/widgets/x_image.dart';
import 'package:portfolio/router.dart';
import 'package:x_framework/x_framework.dart';

class HomeServiceModel {
  final String title;
  final IconData icon;
  final Function(BuildContext context) onTap;

  HomeServiceModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

List<HomeServiceModel> services = [
  HomeServiceModel(
    title: TKey.about.name,
    icon: Icons.person,
    onTap: (context) => context.goNamed(Routes.about.name),
  ),
  HomeServiceModel(
    title: TKey.skills.name,
    icon: Icons.code_rounded,
    onTap: (context) {},
  ),
  HomeServiceModel(
    title: TKey.projects.name,
    icon: Icons.work,
    onTap: (context) {},
  ),
  HomeServiceModel(
    title: TKey.contact.name,
    icon: Icons.phone_android_rounded,
    onTap: (context) {},
  ),
  HomeServiceModel(
    title: TKey.services.name,
    icon: Icons.design_services_rounded,
    onTap: (context) {},
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
        XAvatar(asset: Assets.me1, size: 0.2.sh),
        const SizedBox(height: Dimens.xsPadding),
        XText(TKey.myName.translated,
            style: context.titleLarge.copyWith(fontSize: Screen.fromContext(context).isHandset ? 19.sp : 12.sp)),
        XText(TKey.title.translated, color: context.surfaceColor),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, Screen screen) {
    return _buildTablet(context, screen);
  }

  Widget _buildTablet(BuildContext context, Screen screen) {
    return Column(
      children: [
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child: _buildImage(context).center()).expand(),
            Container(child: _buildServices(context, screen).center()).expand(),
          ],
        ),
        const Spacer(),
        const SizedBox(height: Dimens.sPadding),
        _buildChangeLanguage(context),
        const SizedBox(height: Dimens.sPadding),
      ],
    );
  }

  Widget _buildHandset(BuildContext context, Screen screen) {
    return Column(
      children: [
        const Spacer(flex: 2),
        _buildImage(context),
        const Spacer(),
        _buildServices(context, screen),
        const Spacer(flex: 2),
        const SizedBox(height: Dimens.sPadding),
        _buildChangeLanguage(context),
        const SizedBox(height: Dimens.sPadding),
      ],
    );
  }

  Widget _buildServices(BuildContext context, Screen screen) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimens.sPadding),
      separatorBuilder: (context, index) => const SizedBox(height: Dimens.sPadding),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceItem(
          title: service.title.tr(),
          icon: service.icon,
          onTap: () => service.onTap(context),
        );
      },
      itemCount: services.length,
    );
  }

  Widget _buildChangeLanguage(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.isRtl ? context.setLocale(const Locale('en')) : null,
            child: Image.asset(Assets.us, width: 50.h, height: 25.h),
          ),
          const SizedBox(width: Dimens.sPadding),
          GestureDetector(
            onTap: () => context.isRtl ? null : context.setLocale(const Locale('fa')),
            child: Image.asset(Assets.ir, width: 50.h, height: 25.h),
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const ServiceItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XDimens.sPadding.h)),
      child: Container(
        decoration: BoxDecoration(
            border: GradientBoxBorder(
                gradient: LinearGradient(
                    tileMode: TileMode.decal,
                    colors: context.isRtl
                        ? [
                            context.onPrimaryColor.withOpacity(0.0),
                            context.onPrimaryColor.withOpacity(0.015),
                            context.onPrimaryColor.withOpacity(0.15),
                            context.onPrimaryColor.withOpacity(0.25),
                          ]
                        : [
                            context.onPrimaryColor.withOpacity(0.25),
                            context.onPrimaryColor.withOpacity(0.15),
                            context.onPrimaryColor.withOpacity(0.015),
                            context.onPrimaryColor.withOpacity(0.0),
                          ],
                    stops: context.isRtl ? [0.0, 0.15, 0.6, 1.0] : const [0.0, 0.4, 0.85, 1.0])),
            boxShadow: [
              BoxShadow(color: context.primaryColor.withOpacity(0.02)),
            ],
            gradient: LinearGradient(
              tileMode: TileMode.decal,
              //begin: context.locale == const Locale('fa') ? Alignment.centerRight : Alignment.centerLeft,
              //end: context.locale == const Locale('fa') ? Alignment.centerLeft : Alignment.centerRight,
              colors: context.isRtl
                  ? [
                      context.onPrimaryColor.withOpacity(0.0),
                      context.onPrimaryColor.withOpacity(0.01),
                      context.onPrimaryColor.withOpacity(0.15),
                      context.onPrimaryColor.withOpacity(0.3),
                    ]
                  : [
                      context.onPrimaryColor.withOpacity(0.3),
                      context.onPrimaryColor.withOpacity(0.15),
                      context.onPrimaryColor.withOpacity(0.01),
                      context.onPrimaryColor.withOpacity(0.0),
                    ],
              stops: context.isRtl ? [0.0, 0.15, 0.6, 1.0] : const [0.0, 0.4, 0.85, 1.0],
            ),
            borderRadius: BorderRadius.circular(Dimens.sPadding)),
        //color: service.backgroundColor ?? context.tertiary,
        child: XContainer(
          color: Colors.transparent,
          padding: const EdgeInsets.all(XDimens.sPadding).h,
          borderColor: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: context.primaryColor,
                size: 24.h,
              ),
              const SizedBox(width: Dimens.sPadding),
              XText(
                title,
                style: Screen.fromWindow().isXSmall ? context.titleMedium : context.titleSmall,
                color: context.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
