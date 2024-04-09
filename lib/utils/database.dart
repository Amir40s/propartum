

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

// auth
var auth = FirebaseAuth.instance;
var currentUser = FirebaseAuth.instance.currentUser;

// cloud firestore
var firestore = FirebaseFirestore.instance;

// storage
var storage = FirebaseStorage.instance;

class Database{

  static const key_userData = "userData";

  static const collection_doctors = "doctors";
  static const collection_notifcations = "notifications";

  static const key_name = "name";
  static const key_email = "email";
  static const key_password = "password";
  static const key_date = "date";
  static const key_time = "time";
  static const key_timestamp = "timestamp";
  static const key_status = "status";
  static const key_accountType = "accountType";
  static const key_uid = "uid";
  static const key_bio = "bio";
  static const key_country = "country";
  static const key_profileUrl = "profileUrl";
  static const key_onlineStatus = "onlineStatus";
  static const key_title = "title";
  static const key_message = "message";
  static const key_read = "read";
  static const key_rating = "rating";
  static const key_phone = "phone";
  static const key_about = "about";

}