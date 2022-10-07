import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nytimes/data/data.dart';

import '../model/model.dart';

class PostProvider with ChangeNotifier {
  var _results = <Results>[];
  var _data = <Results>[];
  Timer? debouncer;
  String section = 'home';
  int count = 5;

  List<Results> get results => _results;

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }
 
  searchLogic(List<Results> sectionList, List<Results> data, String search) {
    return sectionList = data.where((res) {
      var section = res.section!.toLowerCase().replaceAll(RegExp(r'[-]'), '');
      var title = res.title!.toLowerCase();
      return section.contains(search.toLowerCase()) ||
          title.contains(search.toLowerCase());
    }).toList();
  }

  Future sortList(String search, String section) async => debounce(() async {
        _data.clear();
        if (_data.isEmpty) {
          _data = await Data().getResponse(section);
        }
        var res = <Results>[];
        res = await searchLogic(_results, _data, search);

        res.length - count < 5 ? count = res.length : count = 5;
        _results = List<Results>.generate(count, (index) {
          var itemList = <Results>[];
          itemList.addAll(res);
          return itemList[index];
        }, growable: true);

        notifyListeners();
      });


  Future addItem(
    String search,
    int start,
  ) async {
    try {
      _data = await searchLogic(_results, _data, search);
      if (_data.length - count < 5) {
        var i = _data.length - count;
        count = count + i;
      } else {
        count += 5;
      }
      _results = List<Results>.generate(count, (index) {
        var itemList = <Results>[];
        itemList.addAll(_data);
        return itemList[index];
      }, growable: true);
    } finally {
      notifyListeners();
    }
  }
}
