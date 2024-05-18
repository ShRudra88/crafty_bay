import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/product_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class PopularProductController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> getPopularProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.popularProduct);
    _inProgress = false;
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
