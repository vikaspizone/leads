import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
//change bottom bar index
  int currentIndex = 0;
  changeIndex(tabindex) {
    currentIndex = tabindex;
    notifyListeners();
  }
}
