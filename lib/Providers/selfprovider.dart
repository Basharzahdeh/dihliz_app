import 'package:flutter/cupertino.dart';

import '../Models/selfmanagment_model.dart';

class SelfProvider extends ChangeNotifier {
  List<SelfModel> sel = [
    SelfModel(
      id: '0',
      name: "Enter inventory",
      description: "your inventory can be added to\nthe warehouse",
      Image: "assets/4.png",
    ),
    SelfModel(
      id: "1",
      name: "Withdrawal of inventory",
      description: "you can withdraw your inventory\nfrom the warehouse",
      Image: "assets/5.png",
    ),
    SelfModel(
      id: "2",
      name: "Transfer inventory",
      description: "you can transer stock from\none warehouse to another",
      Image: "assets/6.png",
    ),
  ];
}
