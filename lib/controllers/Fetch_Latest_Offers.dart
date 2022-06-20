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
      Product(1, 'coffee', 'productmage', 'productImage', 3),
      Product(2, 'tea', 'producImage', 'prage', 3),
      Product(3, 'turkish tea', 'productImage', 'producImage', 30),
      Product(4, 'morrocan tea', 'productIme', 'productImage', 30),
    ];
    productList.assignAll(productResult);
  }
}