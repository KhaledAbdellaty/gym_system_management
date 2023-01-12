import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/classes_cubit/classes_cubit.dart';
import 'package:gym_managment/data/repositiories/classes_repo.dart';
import 'package:gym_managment/presentation/widgets/custom_text_field.dart';
import 'package:gym_managment/presentation/widgets/white_card.dart';

import '../../data/model/classes.dart';

class ClassesScreen extends StatelessWidget {

  final name = TextEditingController();

  final price = TextEditingController();

  final count = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override


  @override
  Widget build(BuildContext context) {
    print('=================Build  classes Screen ========================');
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            WhiteCard(
              child: CustomTextField(
                label: 'اسم الحصة',
                onSaved: (value) => name.text == value,
                controller: name,
              ),
            ),
            WhiteCard(
              child: CustomTextField(
                label: 'سعر الأشتراك',
                onSaved: (value) => price.text == value,
                controller: price,
              ),
            ),
            WhiteCard(
              child: CustomTextField(
                label: 'عدد الحصص',
                onSaved: (value) => count.text == value,
                controller: count,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _key.currentState!.save();
                  // BlocProvider.of<ClassesCubit>(context)
                  //   ..addClass(Classes(
                  //     className: name.text,
                  //     sessionsCount: int.parse(count.text),
                  //     price: double.parse(price.text),
                  //   ));

                  ClassesRepo.instance.addClass(
                      className: name.text,
                      price: double.parse(price.text),
                      sessionsCount: int.parse(count.text));
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
