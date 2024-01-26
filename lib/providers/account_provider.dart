import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountProvider extends ChangeNotifier {
  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;

  void setImage(XFile? file) async {
    _selectedImage = file;
    notifyListeners();
  }
}
