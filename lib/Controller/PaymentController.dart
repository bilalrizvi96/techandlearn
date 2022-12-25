// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';
//
// //rafayDev
// class Payment {
//   var paymentIntentData;
//   var newAmount;
//
//   Future<void> makePayment(context, double amount, String? membershipId) async {
//     newAmount = (amount * 100).round();
//     try {
//       paymentIntentData =
//           await createPaymentIntent(double.parse(newAmount.toString()), 'USD');
//       print("paymentIntentData ==> $paymentIntentData");
//       await Stripe.instance
//           .initPaymentSheet(
//             paymentSheetParameters: SetupPaymentSheetParameters(
//                 paymentIntentClientSecret: paymentIntentData!['client_secret'],
// // testEnv: true,
//                 style: ThemeMode.dark,
// // merchantCountryCode: 'US',
//                 merchantDisplayName: 'ANNIE'),
//           )
//           .then((value) {});
// //finish loading
// // EasyLoading.dismiss();
//
//       ///now finally display payment sheeet
//       displayPaymentSheet(context, membershipId);
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }
//
//   createPaymentIntent(double amount, String currency) async {
//     // try {
//     //
//     //   var dio = Dio();
//     //   Map<String, dynamic> body = {
//     //     // 'amount': calculateAmount(amount),
//     //     'amount': (amount).round(),
//     //     'currency': currency,
//     //     'payment_method_types[]': 'card'
//     //   };
//     //   print("body ==> $body");
//     //   dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
//     //   dio.options.headers['Authorization'] = "Bearer ${BaseUrl.secretKey}";
//     //   var response = await dio.post(
//     //     'https://api.stripe.com/v1/payment_intents',
//     //     data: body,
//     //   );
//     //   print('Create Intent reponse ===> ${response.data.toString()}');
//     //   if(response.statusCode == 200){
//     //     return response.data;
//     //   }else{
//     //     Get.snackbar("Error", "Something went wrong");
//     //     return null;
//     //   }
//     // } catch (err) {
//     //   print('createPaymentIntent ==> ${err.toString()}');
//     // }
//   }
//   displayPaymentSheet(context, String? membershipId) async {
//     try {
//       await Stripe.instance
//           .presentPaymentSheet(
//               parameters: PresentPaymentSheetParameters(
//         clientSecret: paymentIntentData!['client_secret'],
//         confirmPayment: true,
//       ))
//           .then((newValue) async {
//         ///save function will send data to backend
//         await save(context, paymentIntentData['id'], membershipId);
//       }).onError((error, stackTrace) {
//         print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//       });
//     } on StripeException catch (e) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $e');
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//                 content: Text("Cancelled "),
//               ));
//     } catch (e) {
//       print('$e');
//     }
//
//     print("check2");
//     print(paymentIntentData.toString());
//     log(paymentIntentData['id']);
//   }
//
//   calculateAmount(String amount) {
//     final a = int.parse(((double.parse(amount)) * 100).toString());
//     return a.toString();
//   }
//
//   save(context, id, String? membershipId) {
//     debugPrint("packageId ==> ${membershipId}");
//     // SubscriptionController controller = Get.put(SubscriptionController());
//     // controller.membershipPayment(
//     //     amount: newAmount, membershipId: membershipId, transactionId: id);
//   }
// }