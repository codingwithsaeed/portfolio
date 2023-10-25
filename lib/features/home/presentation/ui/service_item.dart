import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:portfolio/core/extensions.dart';
import 'package:x_framework/x_framework.dart';

class ServiceItem extends StatelessWidget {
  final bool gradientBackground;
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const ServiceItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isSelected = false,
    this.gradientBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XDimens.sPadding.h)),
      child: Container(
        decoration: BoxDecoration(
            color: gradientBackground
                ? Colors.transparent
                : isSelected
                    ? context.onPrimaryColor.withOpacity(0.1)
                    : Colors.transparent,
            border: !isSelected
                ? GradientBoxBorder(
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
                                context.onPrimaryColor.withOpacity(0.3),
                                context.onPrimaryColor.withOpacity(0.15),
                                context.onPrimaryColor.withOpacity(0.01),
                                context.onPrimaryColor.withOpacity(0.0),
                              ],
                        stops: context.isRtl ? [0.0, 0.15, 0.6, 1.0] : const [0.0, 0.3, 0.65, 1.0]))
                : Border.all(color: context.onPrimaryColor),
            boxShadow: [
              BoxShadow(color: context.primaryColor.withOpacity(0.02)),
            ],
            gradient: gradientBackground
                ? LinearGradient(
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
                    stops: context.isRtl ? [0.0, 0.35, 0.7, 1.0] : const [0.0, 0.3, 0.65, 1.0],
                  )
                : null,
            borderRadius: BorderRadius.circular(XDimens.sPadding.h)),
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
                color: context.onPrimaryColor.withOpacity(0.7),
                size: 24.h,
              ),
              SizedBox(width: XDimens.sPadding.h),
              XText(
                title,
                style: Screen.fromWindow().isXSmall ? context.bodyMedium : context.bodySmall,
                color: context.onPrimaryColor.withOpacity(0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
