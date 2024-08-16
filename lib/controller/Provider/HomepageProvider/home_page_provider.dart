import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopcart/Const/local_images.dart';
import 'package:shopcart/controller/Service/cart_item.dart';
import 'package:shopcart/controller/Service/favor_list.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isfavor = false;
 
  String _error = 'Something Went Wrong';
  final ItemImage _itemImage = ItemImage([],
      itemText: [],
      adds: [],
      shirts: [],
      bank: [],
      pants: [],
      itemPrice: [],
      itemName: [],
      imagePath: '');
  final TextEditingController _userSearchController = TextEditingController();
  final PageController _pageViewController = PageController();
  int _currentImage = 0;
  Timer? _timer;
  int _selectedIndex = 0;
  double _cartTotal = 0.0;
  Map<String, CartItem> _cartItems = {};
  Map<String, FavorList> _favorList = {};

  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  bool get isfavor => _isfavor;
  double get cartTotal => _cartTotal;
  String get error => _error;
  List _items = [];
  List get items => _items;
  ItemImage get itemImage => _itemImage;
  TextEditingController get userSearchController => _userSearchController;
  PageController get pageViewController => _pageViewController;
  int get currentImage => _currentImage;
  Timer? get timer => _timer;

  final List<Map<String, String>> _products = [];

  List<Map<String, String>> get products => _products;
  Map<String, FavorList> get favorList => {..._favorList};
  int get favorItemCount => _favorList.length;
  double get totalFavorCount {
    double total = 0.0;
    _favorList.forEach((key, favorItem) {
      total += favorItem.price * favorItem.quantity;
    });
    return total;
  }

  Map<String, CartItem> get cartItems => {..._cartItems};
  int get cartItemCount => _cartItems.length;
  double get totalCartAmount {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  HomePageProvider() {
    _startAutoScroll();
  }

  get imagePath => null;

  set items(List value) {
    _items = value;
    notifyListeners();
  }

  set cartTotal(double value) {
    _cartTotal = value;
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void clickedfavor() {
    _isfavor = !_isfavor;
    notifyListeners();
  }

  void setError(String value) {
    _error = value;
    notifyListeners();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentImage++;
      if (_currentImage >= _itemImage.shirts.length) {
        _currentImage = 0;
      }
      _pageViewController.animateToPage(
        _currentImage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    });
  }



  Future<void> fetchData() async {
    setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      _itemImage.shirts.addAll(['assets/shirt1.png', 'assets/shirt2.png']);
      _itemImage.itemText.addAll(['Shirt 1', 'Shirt 2']);
      _itemImage.adds.addAll(['assets/add1.png', 'assets/add2.png']);
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  void addItemToCart(
      String productId, double price, String title, String imagePath) {
    if (cartTotal != 0.0) {
      cartTotal += price;
    } else {
      cartTotal = price;
    }
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
          imagePath: imagePath,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
          imagePath: imagePath,
        ),
      );
    }
    notifyListeners();
  }

  void removeItemFromCart(
      {required String key, required int qty, required double price}) {
    
    if (_cartItems.containsKey(key)) {
      cartTotal = cartTotal - price * qty; 
      _cartItems.remove(key);
      print('Removed item with key: $key');
    } else {
      print('Item with key: $key not found');
    }
    notifyListeners();
  
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  void addItemToFavorList(
          String image, double price, String title, int index) {
    if (_favorList.containsKey(image)) {
      _favorList.update(
        image,
        (existingFavorItem) => FavorList(
          id: existingFavorItem.id,
          title: existingFavorItem.title,
          quantity: existingFavorItem.quantity + 1,
          price: existingFavorItem.price,
        ),
      );
    } else {
      _favorList.putIfAbsent(
        image,
        () => FavorList(
          id: index.toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItemFromFavorList(String key) {
    _favorList.remove(key);
    notifyListeners();
  }

  void clearFavorList() {
    _favorList = {};
    notifyListeners();
  }
}