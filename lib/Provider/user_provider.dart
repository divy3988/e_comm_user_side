import 'package:e_comm/Firestore-Firebase/auth_method.dart';
import 'package:e_comm/Models/User_data.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  UserData? _user;
  final Authmethod _authMethods = Authmethod();

  UserData? get getUser => _user;
  Future<void> refreshUser() async {
    UserData user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
