import 'package:flutter/material.dart';
import 'package:portfolio/core/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Center(
          child: CircleAvatar(
            radius: 400,
            child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png'),
          ),
        ));
  }
}
