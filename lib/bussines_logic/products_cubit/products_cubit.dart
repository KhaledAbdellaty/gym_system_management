import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_managment/data/model/products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState());

  addProduct({
    required String productName,
  }) {
    final Products products = Products()..name = productName;
  }
}
