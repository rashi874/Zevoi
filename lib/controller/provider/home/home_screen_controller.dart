import 'package:flutter/widgets.dart';
import 'package:zevoyi/model/home_models/carousal_model.dart';
import 'package:zevoyi/utils/debouncer.dart';

import '../../../model/home_models/category_model.dart';
import '../../../model/home_models/product_model.dart';
import '../../../routes/rout_names.dart';
import '../../../services/home/home_service.dart';
import '../../../view/home/model/product_collection_model.dart';
import '../../../view/product_screen/widgets/utils/prouductid_model.dart';

class HomeScreenProvider with ChangeNotifier {
  HomeScreenProvider() {
    callHomeFunctions();
  }
  final TextEditingController controller = TextEditingController();
  List<CarousalModel> carousalList = [];
  List<CategoryModel> categoryList = [];
  List<Product> productList = [];
  final debouncer = Debouncer(milliseconds: 200);

  bool loading = false;

  void callHomeFunctions() {
    getCarousals();
    getCategories();
    getProducts();
    notifyListeners();
  }

  void toProductScreen(context, productId, categoryId) {
    final args = ProductIdModel(productId: productId, categoryId: categoryId);
    Navigator.of(context).pushNamed(
      RouteNames.productScreen,
      arguments: args,
    );
  }

  void toCollectionScreen(
      BuildContext context, String category, String categoryId) {
    productList.clear();
    final args = ProductCollectionScreenModel(
        category: category, categoryId: categoryId);
    Navigator.of(context)
        .pushNamed(
      RouteNames.productCollections,
      arguments: args,
    )
        .then((value) {
      getProducts();
    });
  }

  Future<void> getCarousals() async {
    loading = true;
    notifyListeners();
    await HomeService().getCarousals().then((value) {
      if (value != null) {
        carousalList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void getCategories() async {
    loading = true;
    notifyListeners();
    await HomeService().getCategories().then((value) {
      if (value != null) {
        categoryList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  void getProducts() async {
    loading = true;
    notifyListeners();
    await HomeService().getAllProducts().then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();

        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  Future<void> searchProducts(String text) async {
    loading = true;
    notifyListeners();
    await HomeService().searchProducts(text).then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }

  void getProductsByCategory(String idCategory) async {
    loading = true;
    notifyListeners();
    await HomeService().getProductsByCategory(idCategory).then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        loading = false;
        notifyListeners();
        null;
      }
    });
  }

  List<Product> findByCategoryId(String categoryId) {
    return productList
        .where((element) => element.category.contains(categoryId))
        .toList();
  }

  CategoryModel findByName(String id) {
    return categoryList.firstWhere((element) => element.id == id);
  }

  Product findById(String id) {
    return productList.firstWhere((element) => element.id == id);
  }
}
