part of 'page.dart';

class _Provider extends ChangeNotifier{
  int _currentPageIndex = 0;

  void setCurrentPageIndex(int value){
    _currentPageIndex = value;
    notifyListeners();
  }

  int get currentPageIndex => _currentPageIndex;
}