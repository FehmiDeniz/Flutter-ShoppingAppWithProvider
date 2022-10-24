import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  List? basket = [];
  List? ramBasket = [];
  String get price => "${getPrice().toString()} \$";
  String get ramPrice => getRamPrice().toString();
  int pieces = 0;

  List? sliderMenu = [
    {"image": "assets/ic_menu.png"},
    {"image": "assets/ic_menu.png"},
    {"image": "assets/ic_menu.png"},
  ];
  List? topDealProducts = [
    {
      "id": 1,
      "title": "Strawberry",
      "image": "assets/im_strawberry.png",
      "price": 6,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "id": 2,
      "title": "Tomatoes",
      "image": "assets/im_tomatoes.png",
      "price": 5,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "id": 3,
      "title": "Carrot",
      "image": "assets/im_carrot.png",
      "price": 8,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
  ];

  List? popularProducts = [
    {
      "id": 4,
      "title": "Eggplant",
      "image": "assets/im_eggplant.png",
      "price": 5,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "id": 5,
      "title": "Banana",
      "image": "assets/im_banana.png",
      "price": 9,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "id": 6,
      "title": "Meat",
      "image": "assets/im_et.png",
      "price": 10,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    }
  ];

  int getPrice() {
    int price = 0;
    for (var i = 0; i < basket!.length; i++) {
      price += int.parse(basket![i]["price"].toString());
    }
    return price;
  }

  int getRamPrice() {
    int RamPrice = 0;
    for (var i = 0; i < ramBasket!.length; i++) {
      RamPrice += int.parse(ramBasket![i]["price"].toString());
    }
    return RamPrice;
  }

  void addBasket(Object value) {
    basket!.add(value);
    notifyListeners();
  }

  void removeBasket(int index) {
    basket!.removeAt(index);
    notifyListeners();
  }

  void clearBasket() {
    basket = [];
    notifyListeners();
  }

  void addRamPrice(Object value) {
    ramBasket!.add(value);
    notifyListeners();
  }

  void removeRamPrice(Object index) {
    ramBasket!.remove(index);
    notifyListeners();
  }

  void clearRamBasket() {
    ramBasket = [];
    notifyListeners();
  }
}
