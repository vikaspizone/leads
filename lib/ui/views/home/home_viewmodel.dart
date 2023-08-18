import 'package:stacked/stacked.dart';

int currentIndex = 0;

class HomeViewModel extends BaseViewModel {
  bool isItAlreadyOnTab(index, currentIndex, tabIndex) {
    return index == tabIndex && currentIndex != tabIndex;
  }

  changeIndex(tabindex) {
    currentIndex = tabindex;
    notifyListeners();
  }
}
