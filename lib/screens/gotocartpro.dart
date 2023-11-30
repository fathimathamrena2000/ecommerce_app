import 'package:ecommerce_app/api/newbornapi.dart';
import 'package:flutter/material.dart';

class Cartprovider with ChangeNotifier {
  final List<int> _cartitem = [];
  List<int> get cartitem => _cartitem;
  static List cartitemPrices = [];
  int? productID;
  Newbornimg? productDatas;

  double _total = 0.0;
  double get totalPrice => _total;

  void addcart(int id) {
    _cartitem.add(id);
    notifyListeners();
  }

  void removefromcart(int id) {
    _cartitem.remove(id);
    notifyListeners();
  }

  void totalPr() {
    cartitemPrices = _cartitem.map((productid) {
      final product = productDatas!.imgurl!.firstWhere(
        (p) => p.id == productid,
      );
      return product.price;
    }).toList();

    _total = cartitemPrices.fold(0.0, (acc, price) => acc + price);
  }
}
