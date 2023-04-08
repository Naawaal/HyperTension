import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/data/models/user_signup_model.dart';

class ProfileController extends GetxController {
  //Todo: This method will also worked if you don't want to use the model class
  // RxString name = ''.obs;
  // RxString age = ''.obs;
  // RxString mobileNumber = ''.obs;

  // Firenase Instance
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  //Todo: This method will also worked if you don't want to use the model class
  // Future<void> getUserData() async {
  //   final user = auth.currentUser;
  //   final userData = await firestore.collection('users').doc(user!.uid).get();
  //   name.value = userData['name'];
  //   age.value = userData['age'];
  //   mobileNumber.value = userData['mobileNumber'];
  // }

  Future<UserSignupModel> fetchUserDataFromFirebase() async {
    // get the user document from Firebase
    final User user = auth.currentUser!;
    final uid = user.uid;
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userSnapshot.exists) {
      // if the document exists, map it to the UserSignupModel

      return UserSignupModel.fromJson(userSnapshot.data()!);
    } else {
      // if the document does not exist, return null
      return UserSignupModel();
    }
  }
}
