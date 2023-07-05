import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  List<UserModel> _list = [];
  List<UserModel> get getList => _list;

  fetchData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((QuerySnapshot snapshot) {
      _list = [];
      for (var documents in snapshot.docs) {
        Map<String, dynamic> dataMap = documents.data() as Map<String, dynamic>;
        _list.insert(
            0, UserModel.fromMap(map: dataMap, userID: documents.id.trim()));
      }
    });
    update();
  }

  // updateRating({required String doctorID, required List rating}) async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(doctorID)
  //       .update({"rating": rating});
  // }

  UserModel getDoctorById(String userID) {
    // print(userID);
    return _list
        .firstWhere((element) => element.userID.trim() == userID.trim());
  }

  // UserModel getDoctorById(String userID) {
  //   // print(userID);
  //   try {
  //     return _list
  //         .firstWhere((element) => element.userID.trim() == userID.trim());
  //   } catch (e) {
  //     Utils().toastMessage("$e");
  //     // print('User not found: $e');
  //     return Null; // Return null or handle the case when user is not found
  //   }
  // }

  UserModel getCustomerByName(String firstName) {
    return _list
        .where((element) => element.name.trim() == firstName.trim())
        .first;
  }

  deleteData({required String userID}) async {
    await FirebaseFirestore.instance.collection("users").doc(userID).delete();
    _list.removeWhere(
      (element) => element.userID == userID,
    );
    update();
  }
}
