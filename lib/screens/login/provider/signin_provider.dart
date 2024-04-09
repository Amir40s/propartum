import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propartum/model/UserModel.dart';
import 'package:propartum/provider/value_provider.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/utils/database.dart';
import 'package:provider/provider.dart';

import '../../../shared_preference/shared_preference_provider.dart';
import '../../../utils/utilis.dart';

class SignInProvider extends ChangeNotifier{

  Future<void> signInWithGoogle({required email,required password,required BuildContext context}) async{
    final provider = Provider.of<SharedPreferenceProvider>(context,listen: false);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).whenComplete(() {
        final userUID =  FirebaseAuth.instance.currentUser?.uid;
        if(userUID!=null){
          fetchData(userUID,context,provider);
        }

      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);
        print('No user found for that email.');
        Get.snackbar("Error", "No Email Found against");
      } else if (e.code == 'wrong-password') {
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);
        Get.snackbar("something wrong", "Please enter correct password.");
        print('Wrong password provided for that user.');
      }
    }

  }

  Future<void> fetchData(String userUID, BuildContext context, SharedPreferenceProvider provider) async{
    firestore.collection(Database.collection_doctors).doc(userUID)
        .get()
        .then((value) {
       if(value.exists){
         UserModel userModel = UserModel(
             bio: value.get(Database.key_bio).toString(),
             country: value.get(Database.key_country).toString(),
             date: value.get(Database.key_date).toString(),
             email: value.get(Database.key_email).toString(),
             name: value.get(Database.key_name).toString(),
             password: value.get(Database.key_password).toString(),
             profileUrl: value.get(Database.key_profileUrl).toString(),
             status: value.get(Database.key_status).toString(),
             time: value.get(Database.key_time).toString(),
             timestamp: value.get(Database.key_timestamp).toString(),
             uid: value.get(Database.key_uid).toString(),
         );
        provider.setUserData(Database.key_userData, userModel);
         int otpCode = Utils().generateUniqueNumber();
         Utils().sendMail(context: context,recipientEmail: value.get(Database.key_email).toString(),
             otpCode: otpCode.toString());
       }
    });
  }

 Future<void> signOut({required BuildContext context}) async {
   final provider = Provider.of<SharedPreferenceProvider>(context,listen: false);
   Get.defaultDialog(
       title: '',
       backgroundColor: Colors.deepOrange.shade400,
       middleText: 'Sure! you want to logout?',
       onConfirm: () async {
         provider.clearValue(Database.key_userData);
         try {
           if(currentUser!=null){
             await auth.signOut().whenComplete(() {
               Get.offAllNamed(RoutesName.loginScreen);
             });
           }else{
             Get.snackbar("Log out failed", "something wrong");
           }

         } on FirebaseAuthException catch (e) {
           print(e.code);
         }
       },
       confirmTextColor: Colors.black,
       cancelTextColor: Colors.white,
       middleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
       titleStyle: const TextStyle(color: Colors.white),
       buttonColor: Colors.white,
       textCancel: 'No');

  }

}