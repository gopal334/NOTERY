import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier{
  List<Map<String, dynamic>> _mData = [
  ];
  /// Evenets
  void addData(Map<String, dynamic> data){
    _mData.add(data);
    notifyListeners();
  }
  void updateData(int index, Map<String, dynamic> updatedata,){
    _mData[index] = updatedata;
    notifyListeners();
  }
  void deleteData(int index){
    _mData.removeAt(index);
    notifyListeners();

  }
List<Map<String, dynamic>> getData() => _mData;
}
