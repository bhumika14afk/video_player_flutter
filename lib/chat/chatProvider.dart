import 'package:flutter/widgets.dart';

class ChatProvider extends ChangeNotifier {
  String _id = '';
  String get id => _id;
  set setid(String value) {
    _id = value;
  }
}
