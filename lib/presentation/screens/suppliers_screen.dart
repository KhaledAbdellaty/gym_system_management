import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gym_managment/data/model/suppliers.dart';
import 'package:gym_managment/data/repositiories/suppliers_repo.dart';
import 'package:gym_managment/presentation/widgets/custom_app_bar.dart';
import 'package:gym_managment/presentation/widgets/custom_text_field.dart';

class SuppliersScreen extends StatelessWidget {
  SuppliersScreen({super.key});
  final supplierController = TextEditingController();
  final searchSuppliersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onSearchChange: (value) {}, controller: searchSuppliersController),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextField(
                label: 'اسم المورد',
                controller: supplierController,
                onSaved: (value) {
                  supplierController.text = value!;
                }),
            ElevatedButton(
                onPressed: () => SuppliersRepo.instance
                    .addSupplier(name: supplierController.text),
                child: Text('Add')),
            Expanded(
                child: StreamBuilder<List<Suppliers>>(
              stream: SuppliersRepo.instance.getsuppliersStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('Empty'),
                    );
                  } else {
                    return DataTable2(
                      columns: const [
                        DataColumn2(label: Text('Id')),
                        DataColumn2(label: Text('الاسم')),
                        DataColumn2(label: Text('عدد المنتجات')),
                        DataColumn2(label: Text('الفواتير')),
                      ],
                      rows: [
                        for (var s = 0; s < snapshot.data!.length; s++)
                          DataRow2(
                            cells: [
                              DataCell(Text(snapshot.data![s].id.toString())),
                              DataCell(Text(snapshot.data![s].name!)),
                              DataCell(Text(snapshot.data![s].products != null
                                  ? snapshot.data![s].products.length.toString()
                                  : 'لا يوجد منتحات')),
                              DataCell(Text(snapshot.data![s].bills != null
                                  ? snapshot.data![s].bills.length.toString()
                                  : 'لا يوجد فواتير')),
                            ],
                          ),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
