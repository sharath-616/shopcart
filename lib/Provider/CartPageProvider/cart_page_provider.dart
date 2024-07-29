import 'package:flutter/material.dart';

class CartPageProvider extends ChangeNotifier {
  final bool _isLoading = false;

  bool get isLoading => _isLoading;
}
