import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';
import 'package:portfolio/core/dimens.dart';
import 'package:portfolio/core/widgets/x_image.dart';
import 'package:portfolio/features/home/domain/entities/home_service_model.dart';
import 'package:portfolio/features/home/presentation/store/home_ui_store.dart';
import 'package:x_framework/x_framework.dart';
import 'package:portfolio/core/extensions.dart';

import 'service_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeUiStore>();
    return Scaffold(
      body: AdaptiveBuilder(
        defaultBuilder: (context, screen) => _buildDesktop(context, screen, store),
        layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
          desktop: (context, screen) => _buildDesktop(context, screen, store),
          tablet: (context, screen) => _buildTablet(context, screen, store),
          handset: (context, screen) => _buildHandset(context, screen, store),
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
        XText(context.l10n.myName,
            style: context.titleLarge.copyWith(
              fontWeight: FontWeight.w900,
            )),
        XText(
          context.l10n.title,
          color: context.surfaceColor,
          style: context.titleMedium,
        ),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, Screen screen, HomeUiStore store) {
    return Row(
      children: [
        Container(
          color: context.onPrimaryColor.withOpacity(0.05),
          child: _buildServices(context, screen, store).center(),
        ).expand(flex: 2),
        Observer(builder: (context) => store.servicePage).expand(flex: 9),
      ],
    );
  }

  Widget _buildTablet(BuildContext context, Screen screen, HomeUiStore store) {
    return Row(
      children: [
        Container(
          color: context.onPrimaryColor.withOpacity(0.05),
          child: _buildServices(context, screen, store).center(),
        ).expand(flex: 3),
        Observer(builder: (context) => store.servicePage).expand(flex: 7),
      ],
    );
  }

  Widget _buildHandset(BuildContext context, Screen screen, HomeUiStore store) {
    return Column(
      children: [
        const Spacer(flex: 2),
        _buildImage(context),
        const Spacer(),
        _buildServices(context, screen, store),
        const Spacer(flex: 2),
        const SizedBox(height: Dimens.sPadding),
        _buildChangeLanguage(context, store),
        const SizedBox(height: Dimens.sPadding),
      ],
    );
  }

  Widget _buildServices(BuildContext context, Screen screen, HomeUiStore store) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!screen.isHandset) const Spacer(),
        ListView.separated(
          padding: const EdgeInsets.all(Dimens.sPadding),
          separatorBuilder: (context, index) => const SizedBox(height: Dimens.sPadding),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final service = services[index];
            return Observer(builder: (_) {
              return ServiceItem(
                title: service.type.translate(context),
                icon: service.icon,
                onTap: () => service.onTap(context),
                isSelected: store.selectedService == service.type,
              );
            });
          },
          itemCount: services.length,
        ),
        if (!screen.isHandset) ...[
          const Spacer(),
          _buildChangeLanguage(context, store),
          SizedBox(height: Dimens.sPadding.h),
        ]
      ],
    );
  }

  Widget _buildChangeLanguage(BuildContext context, HomeUiStore store) {
    return SizedBox(
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.isFarsi ? store.setLocale(const Locale('en')) : null,
            child: Image.asset(Assets.us, width: 30.h, height: 25.h),
          ),
          const SizedBox(width: Dimens.sPadding),
          GestureDetector(
            onTap: () => context.isFarsi ? null : store.setLocale(const Locale('fa')),
            child: Image.asset(Assets.ir, width: 30.h, height: 25.h),
          ),
        ],
      ),
    );
  }
}

class CenterDesktopImage extends StatelessWidget {
  const CenterDesktopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.onPrimaryColor.withOpacity(0.01),
      child: const CenterImage().center(),
    );
  }
}

class CenterImage extends StatelessWidget {
  const CenterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        XAvatar(asset: Assets.me1, size: 0.2.sh),
        const SizedBox(height: Dimens.xsPadding),
        XText(
          context.l10n.myName,
          style: context.titleLarge.copyWith(fontWeight: FontWeight.w900),
        ),
        XText(context.l10n.title, color: context.surfaceColor, style: context.titleMedium),
      ],
    );
  }
}
