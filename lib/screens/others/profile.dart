import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contruction0/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../a_widgets/custom_button.dart';
import '../../core/utlis.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "";
  String address = "";
  String number = "";
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var var1 = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      name = var1.data()?['Name'];
      email = var1.data()?['Email'];
      address = var1.data()?['Address'];
      number = var1.data()?['Phone Number'];
    });
  }

  String currentImage = "assets/men.avif";

  void changeImage() {
    setState(() {
      if (currentImage == "assets/men.avif") {
        currentImage = "assets/profile1.avif";
      } else {
        currentImage = "assets/men.avif";
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "User Profile.",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: const AssetImage("assets/sofa/1sofa.jpg"))),
          child: ListView(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: changeImage,
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(currentImage),
                ),
              ),
            ),
            // RatingBar.builder(
            //           initialRating: rating,
            //           minRating: 0,
            //           allowHalfRating: true,
            //           itemCount: 5,
            //           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //           itemBuilder: (context, _) => Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //           ),
            //           ignoreGestures: true,
            //           onRatingUpdate: (rating) {
            //             print(rating);
            //           },
            //         ),

            const Padding(
              padding: EdgeInsets.only(top: 40, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name:",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    email,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    number,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Address',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    address,
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const Divider(),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: CustomButton(
                      text: "Logout",
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Utils2.toastMessage("You logout");
                        Get.to(const Login());
                      })),
            )
          ]),
        )));
  }
}
// }
// const SizedBox(height: 40),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               const Icon(Icons.person_2_rounded),
//               const SizedBox(
//                 width: 75,
//               ),
//               const Text(
//                 "Account",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 width: 100,
//               ),
//               IconButton(
//                 onPressed: () {
//                   Get.to(const HomeService());
//                 },
//                 icon: const Icon(Icons.arrow_forward),
//                 iconSize: 25,
//               )
//             ],
//           ),
//           const SizedBox(height: 40),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               const Icon(Icons.info),
//               const SizedBox(
//                 width: 70,
//               ),
//               const Text(
//                 "About Us",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 width: 100,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_forward),
//                 iconSize: 25,
//               )
//             ],
//           ),
//           const SizedBox(height: 40),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               const Icon(Icons.location_on),
//               const SizedBox(
//                 width: 75,
//               ),
//               const Text(
//                 "Address",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 width: 100,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_forward),
//                 iconSize: 25,
//               )
//             ],
//           ),
//           const SizedBox(height: 40),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               const Icon(Icons.card_giftcard),
//               const SizedBox(
//                 width: 70,
//               ),
//               const Text(
//                 "Rewards",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 width: 100,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_forward),
//                 iconSize: 25,
//               )
//             ],
//           ),
//           const SizedBox(height: 40),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               const Icon(Icons.wallet),
//               const SizedBox(
//                 width: 70,
//               ),
//               const Text(
//                 "Wallet",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 width: 120,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_forward),
//                 iconSize: 25,
//               )
//             ],
//           ),
//           const SizedBox(height: 40),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               const Icon(Icons.share),
//               const SizedBox(
//                 width: 65,
//               ),
//               const Text(
//                 "Invite Friend",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 width: 70,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.arrow_forward),
//                 iconSize: 25,
//               )
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.09,
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: MediaQuery.of(context).size.height * 0.06,
//             child: CustomButton(
//                 text: "Logout",
//                 onPressed: () {
//                   Get.to(const WellcomeScreen());
//                 }),
//           ),
