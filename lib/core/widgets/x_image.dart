import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/extensions.dart';

class XAvatar extends StatelessWidget {
  final double? size;
  final String? url;
  final String? asset;
  const XAvatar({super.key, this.size, this.asset, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: context.onPrimary,
        shape: const CircleBorder(),
      ),
      padding: EdgeInsets.all(2.w),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.amber.shade900,
          shape: const CircleBorder(),
        ),
        width: size ?? 0.2.sw,
        height: size ?? 0.2.sw,
        padding: EdgeInsets.all(2.w),
        child: CircleAvatar(
                radius: size ?? 0.2.sw,
                foregroundImage: (url != null ? NetworkImage(url!) : AssetImage(asset!) as ImageProvider))
            .center(),
      ),
    );
  }
}
