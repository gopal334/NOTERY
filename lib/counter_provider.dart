import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  /// get value
  getCount() => _count;

  /// events
 void incrementCont(){
   _count++;
   notifyListeners();
 }
 void decrementCount(){
   if(_count>0){
     _count--;
     notifyListeners();
   }

 }
}