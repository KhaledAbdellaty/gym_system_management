part of 'products_cubit.dart';

enum ProductStatus {
  loading,
  loaded,
  faild,
  addProduct,
  deleteProduct,
  editProduct,
}

class ProductsState extends Equatable {
  final ProductStatus productStatus;
  const ProductsState({this.productStatus = ProductStatus.loading});
  ProductsState copyWith({ ProductStatus? productStatus}) {
    return ProductsState(
      productStatus: productStatus  ?? this.productStatus
    );
  }

  @override
  List<Object> get props => [];
}
