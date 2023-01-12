import 'package:flutter/material.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/data/model/suppliers.dart';
import 'package:gym_managment/data/repositiories/classes_repo.dart';
import 'package:gym_managment/data/repositiories/suppliers_repo.dart';
import 'package:gym_managment/presentation/widgets/white_card.dart';
import 'package:sizer/sizer.dart';

import '../../data/model/users.dart';

class GenderDropDown extends StatelessWidget {
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  const GenderDropDown({
    super.key,
    required this.onChanged,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'النوع',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          DropdownButtonFormField<String>(
            
            decoration: InputDecoration(
              fillColor: placeHolder,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            isExpanded: true,
            hint: Text('النوع'),

            items: const [
              DropdownMenuItem(
                value: 'male',
                child: Text(
                  'ذكر',
                ),
              ),
              DropdownMenuItem(
                value: 'female',
                child: Text(
                  'أنثي',
                ),
              ),
            ],
            
            onChanged: onChanged,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}

class ClassesDropDown extends StatefulWidget {
  final void Function(Classes?) onChanged;
  final void Function(Classes?)? onSaved;

  ClassesDropDown({
    super.key,
    required this.onSaved,
    required this.onChanged,
  });

  @override
  State<ClassesDropDown> createState() => _ClassesDropDownState();
}

class _ClassesDropDownState extends State<ClassesDropDown> {
  @override
  void initState() {
    super.initState();
    ClassesRepo.instance.getAllClasses();
  }

  final List<Classes> list = ClassesRepo.instance.getAllClasses();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نظام الأشتراك',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          DropdownButtonFormField<Classes>(
            decoration: InputDecoration(
              fillColor: placeHolder,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            isExpanded: true,
            hint: Text('نظام الأشتراك'),
            value: list.first,
            items: list
                .map(
                  (Classes e) => DropdownMenuItem<Classes>(
                    value: e,
                    child: Text(
                      e.className.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
          ),
        ],
      ),
    );
  }
}

class SubscribeDropDown extends StatelessWidget {
  final void Function(int?)? onChanged;
  final void Function(int?)? onSaved;

  const SubscribeDropDown({
    super.key,
    required this.onChanged,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مدة الأشتراك',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(
              fillColor: placeHolder,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            isExpanded: true,
            hint: Text('مدة الأشتراك'),
            items: [
              for (var s = 1; s <= 12; s++)
                DropdownMenuItem<int>(
                  value: s,
                  child: Text(
                    s.toString(),
                  ),
                ),
            ],
            onChanged: onChanged,
            onSaved: onChanged,
          ),
        ],
      ),
    );
  }
}

class SuppliersDropDown extends StatefulWidget {
  final void Function(Suppliers?) onChanged;
  final void Function(Suppliers?)? onSaved;

  SuppliersDropDown({
    super.key,
    required this.onSaved,
    required this.onChanged,
  });

  @override
  State<SuppliersDropDown> createState() => _SuppliersDropDown();
}

class _SuppliersDropDown extends State<SuppliersDropDown> {
  @override
  void initState() {
    super.initState();
    SuppliersRepo.instance.getAllSuppliers();
  }

  final List<Suppliers> list = SuppliersRepo.instance.getAllSuppliers();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المورد',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<Suppliers>(
              decoration: InputDecoration(
                fillColor: placeHolder,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              isExpanded: true,
              value: list.first,
              items: list
                  .map(
                    (Suppliers e) => DropdownMenuItem<Suppliers>(
                      value: e,
                      child: Text(
                        e.name.toString(),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
            ),
          ),
        ],
      ),
    );
  }
}
