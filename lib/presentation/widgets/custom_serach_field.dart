import 'package:flutter/material.dart';
import 'package:gym_managment/core/color.dart';

class CustomSearchField extends StatelessWidget {
  ValueSetter<String>? onChange;
   TextEditingController controller = TextEditingController();
   CustomSearchField({super.key,required this.controller,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: yellowBorderColor),
          color: yellowFillColor),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.end,
        cursorColor: blueColor,
        maxLines: 1,
        style: Theme.of(context).textTheme.subtitle2,
        decoration: InputDecoration(
          suffixIcon: Image.asset(
            'assets/icons/search.png',
            scale: 2,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.subtitle2,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: fontPlaceHolderColor),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
