import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final userName = 'Loading...'.obs;

  // Firebase Instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getUserName() async {
    final User user = auth.currentUser!;
    final String uid = user.uid;

    firestore.collection('users').doc(uid).get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        userName.value = doc['name'];
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
