import 'package:get/get.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import '../../models/category_list_item.dart';


class CartListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  CategoryListItem _cartListModel = CategoryListItem();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  CategoryListItem get cartListModel => _cartListModel;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(
      Urls.cartList,
    );
    if (response.isSuccess) {
      _cartListModel = CategoryListItem.fromJson(response.responseData);
      _totalPrice.value = _calculateTotalPrice;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  void updateQuantity(int id, int quantity) {
    _cartListModel.CategoryListItem?.firstWhere((element) => element.id == id)
        .quantity = quantity;
    _totalPrice.value = _calculateTotalPrice;
  }

  double get _calculateTotalPrice {
    double total = 0;
    for (CategoryListItem item in _cartListModel.CategoryListItem ?? []) {
      total +=
          (double.tryParse(item.product?.price ?? '0') ?? 0) * item.quantity;
    }
    return total;
  }
}