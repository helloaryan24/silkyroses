// Future<void> signin(String email, String password) async {
//   showLoading();
//   try {
//     final String signInUrl = ApiUrls.loginapi;
//     final signInResponse = await http.post(
//       Uri.parse(signInUrl),
//       body: {
//         'email': email,
//         'password': password,
//       },
//     );
//     final jsonResponse = jsonDecode(signInResponse.body);
//     final success = jsonResponse['success'];
//     if (success == true) {
//       final userData = jsonResponse['data'];
//       final UserModel user = UserModel.fromJson(userData);
//
//       // Save token using TokenManager
//       await TokenManager.saveToken(user.token);
//
//       closeLoading();
//       final message = jsonResponse['message'];
//       showSuccessSnackbar(
//         message,
//         icon: Icons.check_circle,
//         iconColor: Colors.green,
//         containerColor: Colors.green,
//       );
//
//       // Navigate to the main screen after successful login
//       Get.offAllNamed('/BottomBar_Page');
//     } else {
//       closeLoading();
//       final message = jsonResponse['message'];
//       showSuccessSnackbar(
//         message,
//         icon: Icons.error_outline,
//         iconColor: Colors.red,
//         containerColor: Colors.red,
//       );
//     }
//   } catch (e) {
//     closeLoading();
//     showSuccessSnackbar(
//       'An error occurred while processing your request',
//       icon: Icons.error_outline,
//       iconColor: Colors.red,
//       containerColor: Colors.red,
//     );
//     print('Exception occurred: $e');
//   }
// }
