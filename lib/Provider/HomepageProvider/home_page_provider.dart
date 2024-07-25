import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopcart/Const/local_images.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isfavor = false;
  String _error = 'Something Went Wrong';
  final ItemImage _itemImage = ItemImage([], itemText: [], adds: [], shirts: [], bank: [], pants: []);
  final TextEditingController _userSearchController = TextEditingController();
  final PageController _pageViewController = PageController();
  int _currentImage = 0;
  Timer? _timer;
  int _selectedIndex = 0;


  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  bool get isfavor => _isfavor;
  String get error => _error;
  ItemImage get itemImage => _itemImage;
  TextEditingController get userSearchController => _userSearchController;
  PageController get pageViewController => _pageViewController;
  int get currentImage => _currentImage;
  Timer? get timer => _timer;
  get pageController => null;



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

  HomePageProvider() {
    _startAutoScroll();
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
      print("Auto-scrolling to image $_currentImage");
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
}
