import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/auth_cubit/auth_cubit.dart';
import 'package:gym_managment/bussines_logic/classes_cubit/classes_cubit.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/core/strings.dart';
import 'package:gym_managment/data/model/bills.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/payments.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/data/model/users.dart';
import 'package:gym_managment/data/repositiories/classes_repo.dart';
import 'package:gym_managment/data/repositiories/member_repo.dart';
import 'package:gym_managment/data/repositiories/payments_repo.dart';
import 'package:gym_managment/main.dart';
import 'package:gym_managment/presentation/widgets/bill_widget.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:gym_managment/presentation/widgets/custom_dropdown.dart';
import 'package:gym_managment/presentation/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../data/model/classes.dart';
import '../../objectbox.g.dart';
import 'test_screen.dart';

class AddMembersScreen extends StatelessWidget {
  final name = TextEditingController();

  final phoneNo = TextEditingController();

  final paymentController = TextEditingController();

  final GlobalKey<FormState> _memberkey = GlobalKey<FormState>();

  String gender = '';
  Classes classe = Classes();

  int subscribeLong = 0;
  double price = 0;
  double deptPrice = 0;
  Member? member;

  //List<SubscribeModel> allSubscribe = [];
  @override
  Widget build(BuildContext context) {
    print('================= Member Screen ========================');

    addMember() {
      _memberkey.currentState!.save();
      BlocProvider.of<MemberCubit>(context).addMember(
          classe: classe,
          subscribeLong: subscribeLong,
          memberName: name.text,
          gender: gender,
          phoneNo: phoneNo.text);
    }

    return Scaffold(
      appBar: CustomAppBar(
          onSearchChange: (value) {}, controller: TextEditingController()),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _memberkey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        label: 'الأسم',
                        controller: name,
                        onSaved: (newValue) => name.text = newValue!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        label: 'رقم التليفون',
                        controller: phoneNo,
                        onSaved: (newValue) => phoneNo.text = newValue!,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GenderDropDown(
                        onChanged: (genderValue) {
                          if (genderValue != null) {
                            gender = genderValue;
                            print('OnChange Gender Value : $gender');
                          }
                        },
                        onSaved: (genderValue) {
                          if (genderValue != null) {
                            gender = genderValue;
                            print('OnSaved Gender Value : $gender');
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClassesDropDown(
                        onChanged: (classValue) {
                          classe = classValue!;
                          print(
                              'OnChange Class Value : ${classe.className} : ${classe.price} : ${classe.sessionsCount}');
                        },
                        onSaved: (classeValue) {
                          if (classeValue != null) {
                            classe = classeValue;
                            print('OnSaved Class Value : ${classe.className}');
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SubscribeDropDown(
                        onChanged: (subscribeValue) {
                          if (subscribeValue != null) {
                            subscribeLong = subscribeValue;
                            print(
                                'OnChange Subscribe Long Value : $subscribeLong');
                          }
                          // price = subscribeLong! * classe!.price!;
                        },
                        onSaved: (subscribeValue) {
                          if (subscribeValue != null) {
                            subscribeLong = subscribeValue;
                            print(
                                'OnSaved Subscribe Long Value : $subscribeLong');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Text(subscribe != null
              //     ? subscribe!.amountSubscribe(classChosen!.price!).toString()
              //     : '0'),
              ElevatedButton(
                  onPressed: () {
                    member = addMember();
                  },
                  child: Text('اضافة عضو')),
              buildBillMember(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBillMember() {
    return BlocConsumer<MemberCubit, MemberState>(
      listener: (context, state) {
        if (state is MemberFailed) {
          print(state.errorMsg.toString());

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
            backgroundColor: Colors.red,
          ));
        } else if (state is MemberSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
            backgroundColor: Colors.green,
          ));
        }
        //print(state.memberStatus.toString());
      },
      builder: (context, state) {
        if (state is MemberLoaded) {
          return BillWidget(
            billPrice: state.totalPrice!,
            deptPrice: state.totalDept ?? deptPrice,
            member: state.member!,
          );
        }

        return const Expanded(
          child: Center(
            child: Text('No Bills Yet'),
          ),
        );
      },
    );
  }
}
