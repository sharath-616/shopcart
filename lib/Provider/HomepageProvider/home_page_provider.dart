import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopcart/Const/local_images.dart';
import 'package:shopcart/Service/cart_item.dart';
import 'package:shopcart/Service/favor_list.dart';

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
      itemName: []);
  final TextEditingController _userSearchController = TextEditingController();
  final PageController _pageViewController = PageController();
  int _currentImage = 0;
  Timer? _timer;
  int _selectedIndex = 0;

  Map<String, CartItem> _cartItems = {};
  Map<String, FavorList> _favorList = {};

  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  bool get isfavor => _isfavor;
  String get error => _error;
  List _items = [];
  List get items => _items;
  ItemImage get itemImage => _itemImage;
  TextEditingController get userSearchController => _userSearchController;
  PageController get pageViewController => _pageViewController;
  int get currentImage => _currentImage;
  Timer? get timer => _timer;

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

  set items(List value) {
    _items = value;
    notifyListeners();
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

  void addItemToCart(String productId, double price, String title) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
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
        ),
      );
    }
    notifyListeners();
  }

  void removeItemFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  void addItemToFavorList(String productId, double price, String title) {
    if (_favorList.containsKey(productId)) {
      _favorList.update(
        productId,
        (existingFavorItem) => FavorList(
          id: existingFavorItem.id,
          title: existingFavorItem.title,
          quantity: existingFavorItem.quantity + 1,
          price: existingFavorItem.price,
        ),
      );
    } else {
      _favorList.putIfAbsent(
        productId,
        () => FavorList(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItemFromFavorList(String productId) {
    _favorList.remove(productId);
    notifyListeners();
  }

  void clearFavorList() {
    _favorList = {};
    notifyListeners();
  }
}
