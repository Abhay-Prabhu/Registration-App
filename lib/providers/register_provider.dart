import 'package:flutter/foundation.dart';

class RegisterProvider extends ChangeNotifier {
  bool _isLoading = false;

  String? _role;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phoneNumber;
  String? _currentCity;
  String? _experience;
  String? _bio;
  String? _applyForRole;
  String? _expectFromRoleAndUs;
  String? _expectFromUs;
  String? _otherLinks;


  bool get isLoading => _isLoading;

  String? get role => _role;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get currentCity => _currentCity;
  String? get experience => _experience;
  String? get bio => _bio;
  String? get applyForRole => _applyForRole;
  String? get expectFromRoleAndUs => _expectFromRoleAndUs;
  String? get whatdoYouExpect => _expectFromUs;
  String? get otherLinks => _otherLinks;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set role(String? value) {
    _role = value;
    notifyListeners();
  }

  set firstName(String? value) {
    _firstName = value;
    notifyListeners();
  }

  set lastName(String? value) {
    _lastName = value;
    notifyListeners();
  }

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  set phoneNumber(String? value) {
    _phoneNumber = value;
    notifyListeners();
  }

  set currentCity(String? value) {
    _currentCity = value;
    notifyListeners();
  }

  set experience(String? value) {
    _experience = value;
    notifyListeners();
  }

  set bio(String? value) {
    _bio = value;
    notifyListeners();
  }
}
