import 'package:flutter/material.dart';

import '../../core/color.dart';


class StatueWidget extends StatelessWidget {
  final bool statue;
  const StatueWidget({
    required this.statue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: statue
            ? mintGreenColor.withOpacity(0.7)
            : Colors.red.withOpacity(0.7),
      ),
      child: Center(
          child: Text(
        statue ? 'نشط' : 'غير نشط',
        style: TextStyle(color: statue ? fontGreenColor : Colors.red),
      )),
    );
  }
}
