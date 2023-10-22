import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:portfolio/features/home/presentation/ui/about_screen.dart';
import 'package:portfolio/features/home/presentation/ui/home_screen.dart';
import 'package:x_framework/x_framework.dart';

class AdaptiveMainScreen extends StatefulWidget {
  const AdaptiveMainScreen({super.key});

  @override
  State<AdaptiveMainScreen> createState() => _AdaptiveMainScreenState();
}

class _AdaptiveMainScreenState extends State<AdaptiveMainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return AdaptiveScaffold(
    //   selectedIndex: selectedIndex,
    //   onSelectedIndexChange: (index) => setState(() => selectedIndex = index),
    //   destinations: services
    //       .map((e) => NavigationDestination(
    //             icon: Icon(e.icon),
    //             label: e.title.tr(),
    //           ))
    //       .toList(),
    //   useDrawer: false,
    //   body: (context) => selectedIndex == 0 ? const AboutScreen() : const HomeScreen(),
    // );
    return adaptiveLayout(context);
  }

  Widget adaptiveLayout(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.small : SlotLayout.from(
          key: const Key('Body Small'),
          builder: (context) {
            return const HomeScreen();
          },
        )
      }),
      primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.medium: SlotLayout.from(
          key: const Key('Primary Navigation Medium'),
          inAnimation: AdaptiveScaffold.fadeIn,
          outAnimation: AdaptiveScaffold.fadeOut,
          builder: (_) => AdaptiveScaffold.standardNavigationRail(
            extended: true,
            destinations: services
                .map((e) => NavigationRailDestination(
                      icon: Icon(e.icon),
                      label: XText(e.title.tr()),
                    ))
                .toList(),
            selectedIndex: selectedIndex,
            onDestinationSelected: (int newIndex) => setState(() => selectedIndex = newIndex),
          ),
        )
      }),
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('Bottom Navigation Small'),
            inAnimation: AdaptiveScaffold.fadeIn,
            outAnimation: AdaptiveScaffold.fadeOut,
            builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
              destinations: services
                  .map((e) => NavigationDestination(
                        icon: Icon(e.icon),
                        label: e.title.tr(),
                      ))
                  .toList(),
              currentIndex: selectedIndex,
              onDestinationSelected: (int newIndex) => setState(() => selectedIndex = newIndex),
            ),
          )
        },
      ),
    );
  }
}
