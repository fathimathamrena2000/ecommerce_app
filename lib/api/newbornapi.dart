import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'newbornmodel.dart';

class Newbornimg with ChangeNotifier {
  List<NewBorn>? _imageurl;
  List<NewBorn>? get imgurl => _imageurl;
  String baseurl = "https://fakestoreapi.com/products";
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    var response = await http.get(Uri.parse(baseurl));
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      final data = newBornFromJson(response.body);
      // _imageurl = data[0]['url'];
      _imageurl = data;
      _isLoading = false;

      notifyListeners();
    } else {
      if (kDebugMode) {
        print("error");
      }
    }
  }
}
