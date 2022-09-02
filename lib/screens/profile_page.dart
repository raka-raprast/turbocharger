// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:turbocharger/screens/inspection_garret_page.dart';
// import 'package:turbocharger/screens/inspection_holset_page.dart';
// import 'package:turbocharger/screens/menu_page.dart';
// import 'package:turbocharger/style/colors.dart';
// import 'package:turbocharger/widget/gradient_background_body.dart';
// import 'package:turbocharger/widget/profile_widget.dart';
// import 'package:turbocharger/widget/top_widget.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         body: GradientBackgroundBody(children: [
//           TopWidget(title: "Menu"),
//           ProfileWidget(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 50),
//             child: Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(500),
//                       color: yellow()),
//                   child: Image.asset(
//                     "lib/assets/file.png",
//                   ),
//                 ),
//                 SizedBox(
//                   width: 40,
//                 ),
//                 Text(
//                   "My File",
//                   style: TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w600, color: grey()),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 50),
//             child: Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(500),
//                       color: yellow()),
//                   child: Image.asset(
//                     "lib/assets/profile.png",
//                   ),
//                 ),
//                 SizedBox(
//                   width: 40,
//                 ),
//                 Text(
//                   "Edit Profile",
//                   style: TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.w600, color: grey()),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 60,
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => MenuPage()));
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               width: MediaQuery.of(context).size.width * .55,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: yellow(),
//               ),
//               child: Center(
//                 child: Text(
//                   "Main Menu",
//                   style: TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold, color: grey()),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             width: MediaQuery.of(context).size.width * .55,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: yellow(),
//             ),
//             child: Center(
//               child: Text(
//                 "Sign Out",
//                 style: TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold, color: grey()),
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
