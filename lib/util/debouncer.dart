import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer{
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer = null;

  Debouncer({required this.milliseconds});

  run(VoidCallback action){
    if (null != _timer){
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}