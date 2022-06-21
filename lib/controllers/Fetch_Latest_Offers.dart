import 'package:get/get.dart';
import 'package:tea_salon/models/Product.dart';

class Fetch_Latest_Offers extends GetxController{
  var productList = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    FetchData();
  }
  void FetchData()async{
    await Future.delayed(Duration(seconds: 2),);
    var productResult =[
      Product(1, 'Expresso', 'assets/images/expresso.jpg', 'productImage', 3),
      Product(2, 'Cappuccino', 'assets/images/coffee.jpg', 'prage', 3),
      Product(3, 'Cremy Coffee', 'assets/images/creme_coffee.jpg', 'producImage', 30),
      Product(4, 'morrocan tea', 'assets/images/original_black_tea.jpg', 'productImage', 30),
    ];
    productList.assignAll(productResult);
  }
}