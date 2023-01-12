import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WhiteCard extends StatelessWidget {
  final Widget child;
  const WhiteCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1.5.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(0, 0.2.w),
          ),
        ],
      ),
      child: child,
    );
  }
}
