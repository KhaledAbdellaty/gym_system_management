import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_managment/bussines_logic/member_cubit/member_cubit.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/presentation/widgets/custom_dropdown.dart';

import '../../data/model/member.dart';

class AddSubscribeScreen extends StatelessWidget {
  final Member member;
  int? subscribeLong;
  Classes? classe;
  AddSubscribeScreen({super.key, required this.member});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 1000,
      height: 800,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClassesDropDown(
                  onSaved: (p0) {
                    classe = p0;
                  },
                  onChanged: (p0) {
                    classe = p0;
                  },
                ),
              ),
              Expanded(
                child: SubscribeDropDown(
                  onChanged: (p0) {
                    subscribeLong = p0;
                  },
                  onSaved: (p0) {
                    subscribeLong = p0;
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                context.read<MemberCubit>().addSubscribeToMember(
                    member: member,
                    subscribeLong: subscribeLong!,
                    classe: classe!);
              },
              child: Text('Add')),
        ],
      ),
    );
  }
}
