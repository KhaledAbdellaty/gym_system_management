import 'package:flutter/material.dart';
import 'package:gym_managment/core/color.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:gym_managment/presentation/widgets/custom_dropdown.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onSearchChange: (value) {}, controller: TextEditingController()),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: SizedBox(
                              width: 500,
                              height: 500,
                              child: Column(
                                children: [
                                  Container(
                                    width: 500,
                                    height: 70,
                                    color: yellowColor,
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('إنشاء أمر شراء'),
                                        InkWell(
                                          onTap: () => Navigator.pop(context),
                                          child: const Icon(Icons.arrow_back_ios),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('المورد'),
                                      SizedBox(
                                        width: 300,
                                        height: 135,
                                        child: SuppliersDropDown(
                                          onSaved: (p0) {},
                                          onChanged: (p0) {},
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                child: Text('اذن شراء منتج'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('اذن مصروفات'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
