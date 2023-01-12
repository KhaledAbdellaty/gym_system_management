part of 'navigator_cubit.dart';

class NavigatorCubitState extends Equatable {
  Map<String, Widget> screens = {
    'لوحة التحكم': DashBoardScreen(),
    'أضافة عضو': AddMembersScreen(),
    'الأنشطة': ClassesScreen(),
    'الأعضاء': AllMembersScreen(),
    'الأشتراكات': AllSubscribesScreen(),
    'الموردين': SuppliersScreen(),
    'المنتجات': ProductsScreen(),
    'اذونات': OrdersScreen(),
    'الحسابات': AccountsScreen(),
  };

  final int index;

  NavigatorCubitState({
    this.index = 0,
  });

  @override
  List<Object> get props => [index];

  NavigatorCubitState copyWith({int? index, bool? isSelected}) {
    return NavigatorCubitState(
      index: index ?? this.index,
    );
  }
}
