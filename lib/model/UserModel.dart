import 'package:propartum/utils/database.dart';

class UserModel{
  String? bio,country,email,date,name,password,profileUrl,status,time,timestamp,uid;

  UserModel({
      required this.bio,
      this.country,
      this.email,
      this.date,
      this.name,
      this.password,
      this.profileUrl,
      this.status,
      this.time,
      this.timestamp,
      this.uid});

  // Convert Product object to a map for serialization
  Map<String, dynamic> toJson() {
    return {
      Database.key_bio: bio,
      Database.key_country: country,
      Database.key_email: email,
      Database.key_date: date,
      Database.key_time: time,
      Database.key_name: name,
      Database.key_password: password,
      Database.key_profileUrl: profileUrl,
      Database.key_status: status,
      Database.key_timestamp: timestamp,
      Database.key_uid: uid,
    };
  }

  // Create a Product object from a map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      bio: json[Database.key_bio],
      country: json[Database.key_country],
      email: json[Database.key_email],
      date: json[Database.key_date],
      time: json[Database.key_time],
      timestamp: json[Database.key_timestamp],
      name: json[Database.key_name],
      status: json[Database.key_status],
      password: json[Database.key_password],
      profileUrl: json[Database.key_profileUrl],
      uid: json[Database.key_uid],
    );
  }
}