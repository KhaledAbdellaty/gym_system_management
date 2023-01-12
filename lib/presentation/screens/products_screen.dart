import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/classes.dart';
import 'package:gym_managment/data/model/member.dart';
import 'package:gym_managment/data/model/products.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import 'package:gym_managment/data/model/suppliers.dart';
import 'package:gym_managment/data/repositiories/bills_repo.dart';
import 'package:gym_managment/data/repositiories/classes_repo.dart';
import 'package:gym_managment/data/repositiories/member_repo.dart';
import 'package:gym_managment/data/repositiories/products_repo.dart';
import 'package:gym_managment/data/repositiories/suscribe_repo.dart';
import 'package:gym_managment/objectbox.g.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:gym_managment/presentation/widgets/custom_dropdown.dart';
import 'package:gym_managment/presentation/widgets/custom_text_field.dart';

import '../../data/model/bills.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  final searchProductsController = TextEditingController();
  final productNameController = TextEditingController();
  final productQuntityController = TextEditingController();
  final productPriceController = TextEditingController();
  Suppliers? suppliers;

  @override
  Widget build(BuildContext context) {
    print('=================== ProductScreen=========================');
    return Scaffold(
      appBar: CustomAppBar(
          onSearchChange: (value) {}, controller: searchProductsController),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 700,
              child: Column(
                children: [
                  CustomTextField(
                    label: 'اسم المنتج',
                    controller: productNameController,
                    onSaved: (value) {},
                  ),
                  CustomTextField(
                    label: 'الكمية',
                    controller: productQuntityController,
                    onSaved: (value) {},
                  ),
                  CustomTextField(
                    label: 'السعر',
                    controller: productPriceController,
                    onSaved: (value) {},
                  ),
                  SuppliersDropDown(
                    onSaved: (p0) {
                      suppliers = p0;
                      print(p0);
                    },
                    onChanged: (p0) {
                      suppliers = p0;
                      print(p0);
                    },
                  ),
                  ElevatedButton(
                      onPressed: () => ProductsRepo.instance.addNewProduct(
                          productName: productNameController.text,
                          quantity: int.parse(productQuntityController.text),
                          price: double.parse(productPriceController.text),
                          supplier: suppliers!),
                      child: Text('Add'))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              child: StreamBuilder<List<Products>>(
                stream: ProductsRepo.instance.getProductsStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return DataTable2(columns: const [
                        DataColumn2(label: Text('Id')),
                        DataColumn2(label: Text('اسم المنتج')),
                        DataColumn2(label: Text('الكمية المتاحة')),
                        DataColumn2(label: Text('سعر المنتج')),
                        DataColumn2(label: Text('المورد')),
                      ], rows: [
                        for (var product in snapshot.data!)
                          DataRow2(cells: [
                            DataCell(Text(product.id.toString())),
                            DataCell(Text(product.name.toString())),
                            DataCell(Text(product.count.toString())),
                            DataCell(Text(product.price.toString())),
                            DataCell(Text(product.supplier.hasValue
                                ? product.supplier.target!.name.toString()
                                : 'no')),
                          ])
                      ]);
                    } else {
                      return Center(
                        child: Text('Empty'),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('error'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
