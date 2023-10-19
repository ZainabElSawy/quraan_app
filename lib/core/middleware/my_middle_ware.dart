// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyMiddleWare extends GetMiddleware {
//   @override
//   int? get priority => 1;
//   MyServices myServices = Get.find();
//   @override
//   RouteSettings? redirect(String? route) {
//     if (myServices.sharedPreferences?.getString("onboarding") == "1") {
//       if (myServices.sharedPreferences?.getString("login") ==
//           FirebaseAuth.instance.currentUser!.email) {
//         return const RouteSettings(name: AppRoutes.home);
//       }
//       return const RouteSettings(name: AppRoutes.login);
//     }
//     return null;
//   }
// }
