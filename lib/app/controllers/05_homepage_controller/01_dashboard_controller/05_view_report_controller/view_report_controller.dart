import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/data/models/daily_check_model.dart';

class ViewReportController extends GetxController {
  // Firebase Instance
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  RxList<String> dateList = <String>[].obs;
  RxList<int> bpList = <int>[].obs;
  RxList<int> prList = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDailyChecks();
  }

// Here, we're using two RxList variables for date and bp,
//and in fetchDailyChecks(), we're fetching the documents
//from Firestore, ordering them by date in descending order,
//and mapping the date and bp fields to separate dateList and bpList.

  Future<void> fetchDailyChecks() async {
    final user = auth.currentUser;
    final uid = user!.uid;
    final dailyCheckDocs = await firestore
        .collection('users')
        .doc(uid)
        .collection('dailyCheck')
        .orderBy('date', descending: false)
        .get();
    dateList.value =
        dailyCheckDocs.docs.map((doc) => doc['date']).toList().cast<String>();
    bpList.value =
        dailyCheckDocs.docs.map((doc) => doc['bp']).toList().cast<int>();
    prList.value =
        dailyCheckDocs.docs.map((doc) => doc['pr']).toList().cast<int>();
  }

// Here, we're using a for loop to get data for dailyCheckModels,
// and then we're returning the first dailyCheckModel.
// If the dailyCheckSnapshot is empty, we're returning an empty dailyCheckModel.
// we are not using this function
  Future<DailyCheckModel> getDailyCheck() async {
    final user = auth.currentUser;
    final uid = user!.uid;

    final dailySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('dailyCheck')
        .get();
    if (dailySnapshot.docs.isNotEmpty) {
      final dailyModels = <DailyCheckModel>[];
      for (final doc in dailySnapshot.docs) {
        final dailyCheck = doc.data();
        final dailyModel = DailyCheckModel(
          bp: dailyCheck['bp'],
          pr: dailyCheck['pr'],
          date: dailyCheck['date'],
        );
        dailyModels.add(dailyModel);
      }
      return dailyModels.first;
    } else {
      return DailyCheckModel();
    }
  }
}
