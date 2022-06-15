
import 'package:flutter/foundation.dart';

class BottomNavProvider with ChangeNotifier{

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  set currentIndex(int newIndex) {
    if (_currentIndex != newIndex) {
      _currentIndex = newIndex;
      notifyListeners();
    }
  }
}