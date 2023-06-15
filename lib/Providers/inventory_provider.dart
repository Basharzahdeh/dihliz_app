import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../Models/inventory_model.dart';

class InventoryProvidr extends ChangeNotifier {
  Map<String, InventoryModel> _inven = {};

  Map<String, InventoryModel> get inven {
    return {..._inven};
  }

  addItem(
    String stockId,
    String name,
    File? imgUrl,
    String width,
  ) {
    _inven.putIfAbsent(
      stockId,
      () => InventoryModel(
        id: DateTime.now().toString(),
        name: name,
        Image: imgUrl,
        weidth: width,
        stockid: stockId,
      ),
    );
    notifyListeners();
  }
}
