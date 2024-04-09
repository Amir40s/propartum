import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:propartum/model/UserModel.dart';
import 'package:propartum/utils/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier{
  UserModel? _model;
  UserModel? get model => _model;

  UserDataProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productJson = prefs.getString(Database.key_userData);
    if (productJson != null) {
      Map<String, dynamic> json = jsonDecode(productJson);
      _model = UserModel.fromJson(json);
      notifyListeners();
    }
  }

  Future<void> saveData(UserModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String productJson = jsonEncode(userData.toJson());
    await prefs.setString(Database.key_userData, productJson);
    _model = userData;
    notifyListeners();
  }

}