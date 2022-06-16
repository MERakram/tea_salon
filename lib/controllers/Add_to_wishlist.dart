import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Product.dart';

class Add_to_wishlist_controller extends GetxController{
  var wishList = <Product>[].obs;
  double get totalPrice => wishList.fold(0, (sum, item) => sum + item.price);
  void addToWishlist(Product product){
    wishList.add(product);
  }

}