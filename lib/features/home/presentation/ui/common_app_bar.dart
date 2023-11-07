import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/store/home_ui_store.dart';
import 'package:provider/provider.dart';
import 'package:x_framework/x_framework.dart';

class CommonInScreen extends StatelessWidget {
  final String title;
  final Widget? child;
  const CommonInScreen({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeUiStore>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: context.onPrimaryColor.withOpacity(0.05),
        title: XText(title, style: context.titleMedium),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            store.setSelectedService(null);
            if (store.isHandset) context.pop();
          },
          icon: const Icon(Icons.clear_rounded),
        ),
      ),
      body: child,
    );
  }
}
