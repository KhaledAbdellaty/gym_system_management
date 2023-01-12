import 'package:flutter/material.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/presentation/widgets/white_card.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueSetter<String?> onSaved;
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headline5,
            decoration: InputDecoration(
              fillColor: placeHolder,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.5.h),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.5.h),
                borderSide: const BorderSide(color: primaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.5.h),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.5.h),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            controller: controller,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
