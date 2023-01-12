import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:gym_managment/presentation/widgets/members_overview_widget.dart';
import 'package:gym_managment/presentation/widgets/my_statics_widget.dart';
import '../../bussines_logic/navigator_cubit/navigator_cubit.dart';
import '../../core/responsive.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller: TextEditingController(),
        onSearchChange: (value) {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          //width: double.infinity,
                          height: 335.h,
                          color: Colors.black,
                          child: MediaQuery.of(context).size.width > 1460
                              ? Wrap(
                                  children: List.generate(
                                    4,
                                    (index) => Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        // margin: EdgeInsets.only(right: 10.w),
                                        width: 157.2.w,
                                        height: 160.h,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 160.h,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5.h,
                                      childAspectRatio: 2,
                                      crossAxisSpacing: 0,
                                    ),
                                    itemCount: 4,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.all(10.w),
                                      width: 130.w,
                                      height: 160.h,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          height: 335.h,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
