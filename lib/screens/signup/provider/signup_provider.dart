import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/utils/utilis.dart';

import '../../../notification/notification_services.dart';
import '../../../utils/database.dart';

class SignUpProvider extends ChangeNotifier{



  Future<void> signUpWithGoogle({required email,required password,required fullName}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).whenComplete(() {
        final userUID =  FirebaseAuth.instance.currentUser?.uid;
       if(userUID!=null){
         saveDoctorData(userUID: userUID,email: email,password: password,fullName: fullName);
       }else{
         Utils().snackbar(title: "Something went wrong", message: "Your email is already exits");
       }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

  Future<void> saveDoctorData({required email,required password,required fullName,required userUID}) async{

    DateTime time = DateTime.now();
    try {
      await firestore.collection(Database.collection_doctors).doc(userUID).set({
        Database.key_name: fullName,
        Database.key_email: email,
        Database.key_password : password,
        Database.key_timestamp : time.millisecondsSinceEpoch.toString(),
        Database.key_date : DateFormat.yMMMd().format(DateTime.now()),
        Database.key_time : DateFormat('KK:mm: a').format(DateTime.now()),
        Database.key_uid : userUID,
        Database.key_bio : "no-bio",
        Database.key_country : "country",
        Database.key_profileUrl : "no profile",
        Database.key_status : "active",
        Database.key_onlineStatus : false,
        Database.key_rating : "0.0",
        Database.key_phone : "",
        Database.key_about : "",
      }).whenComplete(() async{
        await firestore
            .collection(Database.collection_doctors)
            .doc(currentUser!.uid)
            .collection(Database.collection_notifcations)
            .add({
          Database.key_title: 'Account Registration',
          Database.key_date: DateFormat.yMMMd().format(DateTime.now()),
          Database.key_time: DateFormat('KK:mm: a').format(DateTime.now()),
          Database.key_message:
          'Congratulations! $fullName your account is created successfully',
          Database.key_read: 'No'
        });
        NotificationService().showNotification(
            title: '🥳 Congratulations!',
            body: '$fullName your account created successfully!');
        Utils().snackbar(
            message: 'Account created successfully!',
            title: '🥳 Successfully!');
      });
      Get.offAllNamed(RoutesName.homeScreen);
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();

  }

}