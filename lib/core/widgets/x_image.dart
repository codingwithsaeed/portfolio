import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

class XAvatar extends StatelessWidget {
  final double? size;
  final String? url;
  final String? asset;
  const XAvatar({super.key, this.size, this.asset, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.onPrimaryColor,
        shape: const CircleBorder(),
      ),
      width: size ?? 0.2.sw,
      height: size ?? 0.2.sw,
      padding: EdgeInsets.all(1.w),
      child: CircleAvatar(
              radius: size ?? 0.2.sw,
              foregroundImage: (url != null ? NetworkImage(url!) : AssetImage(asset!) as ImageProvider))
          .center(),
    );
  }
}
