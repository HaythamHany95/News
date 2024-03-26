import 'package:flutter/material.dart';

class PaginationProvider extends ChangeNotifier {
  bool reachEnd = false;

  void changeScrollPositionStatus(bool newStatus) {
    reachEnd = newStatus;
    notifyListeners();
  }
}
