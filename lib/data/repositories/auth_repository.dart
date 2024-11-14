// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:multi_service/core/routes/route_constant.dart';
// import 'package:multi_service/data/repositories/user_repository.dart';
//
// import 'package:multi_service/features/registration/controller/registration_controller.dart';
//
// import '../../core/common/common_method.dart';
//
// import '../../features/navigation menu/view/widget/navigation_menu_widget.dart';
//
// import '../data sources/local/storage_utility.dart';
// import '../exceptions/firebase_auth_exception.dart';
// import '../exceptions/firebase_exception.dart';
// import '../exceptions/format_exception.dart';
// import '../exceptions/platform_exception_handler.dart';
// import '../models/userModal.dart';
//
// class AuthRepository extends GetxController {
//   static AuthRepository get instance => Get.find();
//   static final GoogleSignIn _googleSignIn = GoogleSignIn();
//   static final userController = Get.put(RegistrationController());
//   // -- Variables
//   final deviceStorage = GetStorage();
//   static final _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final userRepository = Get.put(UserRepository());
//   User? get authUser => _auth.currentUser;
//
//   // -- Called from main.dart  on app launch
//   @override
//   void onReady() {
//     // Redirect to the appropriate screen
//     //SplashController.manageSession();
//     super.onReady();
//   }
//
//   // -- Function to share the Relevant Screen
//   screenRedirect() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       FirebaseAuth.instance.authStateChanges().listen((User? user){
//         // User is signed in
//         if (!user!.emailVerified) {
//           sendEmailVerification();
//         }
//        else {
//       // No user is signed in
//       print("No user currently signed in.");
//       }
//       });
//       // If the user is logged in
//       if (user.emailVerified) {
//         await userController.fetchUserData();
//
//
//         bool? status = userController.user.value.status;
//         if(status == true) {
//           // Initialize User Specific Data
//           if (deviceStorage.read("isFirstTime") == false)
//             await AppLocalStorage.init(user.uid);
//           // If the user's email is verified, navigate to the Navigation Menu
//          // Get.offAllNamed(AppRoutes.navigationMenu);
//          // Navigator.pu
//         }else{
//
//         }
//       } else {
//         // If the user's email is not verified, navigate to the VerifyEmailScreen
//
//         // await EmailVerificationController.sendEmail(email, generatedCode);
//         // Get.toNamed(AppRoutes.emailVerification, arguments: {
//         //   'email': _auth.currentUser?.email,
//         // });
//         print(4);
//         await FirebaseAuth.instance.signOut();
//
//         // Show Warning Message
//
//         //   _auth.currentUser!.sendEmailVerification(ActionCodeSettings(url: url));
//
//         // If the user's email is not verified, navigate to the VerifyEmailScreen
//         // Get.offAllNamed(AppRoutes.signin);
//       }
//     } else {
//       // Local Storage
//
//       // Check if it's the first time launching the app
//
//       deviceStorage.read("isFirstTime") == true;
//           // ? Get.offAllNamed(AppRoutes.signin)
//           // : Get.offAllNamed(AppRoutes.onboarding);
//
//       deviceStorage.writeIfNull("isFirstTime", true);
//     }
//   }
//
//   //? ----------------------- Email & Password sign-in -------------------------------*/
//
//   // [EmailAuthentication] - SignIn
//   Future<UserCredential> signinWithEmailAndPassword(
//       String email,
//       String password,
//       ) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//
//   // [EmailAuthentication] - REGISTER
//   Future<UserCredential> registerWithEmailAndPassword(
//       String email, String password) async {
//
//
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e,stacktrace) {
//       print("Stacktrace auth: $stacktrace");
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//   // Future<void> registerWithEmailAndPassword(String email, String password) async {
//   //   try {
//   //     // Your Firebase or authentication code here
//   //     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//   //   } on FirebaseAuthException catch (e,stacktrace) {
//   //     // Handle specific Firebase exceptions
//   //     if (e.code == 'email-already-in-use') {
//   //       throw Exception('The email address is already in use.');
//   //     } else if (e.code == 'weak-password') {
//   //       throw Exception('The password provided is too weak.');
//   //     } else if (e.code == 'invalid-email') {
//   //       throw Exception('The email address is invalid.');
//   //     } else {
//   //       throw Exception('An unexpected authentication error occurred.. $e and $stacktrace');
//   //     }
//   //   } catch (e,stacktrace) {
//   //     // Handle any other types of exceptions
//   //     throw Exception('An unexpected authentication error occurred . $e and $stacktrace');
//   //   }
//   // }
//
//   // [ReAuthentication] - ReAuthenticate User
//   Future<void> reAuthenticate(String email, String password) async {
//     try {
//       // Create a credential
//       AuthCredential credential = EmailAuthProvider.credential(
//         email: email,
//         password: password,
//       );
//       // Reauthenticate
//       await _auth.currentUser?.reauthenticateWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//
//   // [Email Verification] - MAIL VERIFICATION
//   Future<void> sendEmailVerification() async {
//     try {
//       await _auth.currentUser?.sendEmailVerification();
//       print(e);
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       print(e);
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       print(e);
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       print(e);
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//
//   // [Email Authentication] - FORGET PASSWORD
//   Future<void> sendPasswordResetEmail(String email) async {
//
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//
//
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e,stackTrace) {
//
//       throw 'An unknown error occurred: $e ,$stackTrace';
//     }
//   }
//
//   //? ----------------------- Socail sign-in ------------------------------------------------*/
//
//   Future<User?> signInWithGoogleMedia() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         //CM.showSnackBar(message: "Please register first to proceed");
//         return null; // The user canceled the sign-in
//       }
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;
//       print(user);
//       print(userCredential);
//       print(googleAuth);
//       print(credential);
//
//       // Check if the user's email is registered
//
//       if (user != null) {
//         print(6);
//         // Check if the user exists in Firestore
//         final userDoc = await _db
//             .collection("Users")
//             .doc(AuthRepository.instance.authUser?.uid)
//             .get();
//         if (userDoc.exists) {
//           // User exists, proceed to the app
//          // CM.showSnackBar(message: 'Successfully Login');
//          // Get.offAllNamed(AppRoutes.navigationMenu);
//           // Navigate to the main part of your app
//         } else {
//           print(7);
//           // User does not exist, sign out
//           await _auth.signOut();
//          // CM.showSnackBar(
//             //  message:
//              // 'To proceed, please complete the registration process first');
//         }
//       }
//       // final List<String> registeredEmails = [
//       //   'example1@gmail.com',
//       //   'example2@gmail.com'
//       // ]; // Add your registered emails here
//       // if (user != null && registeredEmails.contains(user.email)) {
//       //   return user;
//       // } else {
//       //   // await signOut();
//       //   return null;
//       // }
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   // [Google Authentication] - GOOGLE
//   // Future<UserCredential?> signInWIthGoogle() async {
//   //   try {// Initiate the Google sign-in process
//   //
//   //     // Trigger the authentication flow
//   //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//   //
//   //
//   //     if (userAccount == null) {
//   //       // The user canceled the sign-in
//   //       CM.showSnackBar(message: "Please register first to proceed");
//   //     }else{
//   //       //Obtain the auth details form the request
//   //       final GoogleSignInAuthentication? googleAccount =
//   //           await userAccount?.authentication;
//   //
//   //       // Create a new credential
//   //       final credentials = GoogleAuthProvider.credential(
//   //         accessToken: googleAccount?.accessToken,
//   //         idToken: googleAccount?.idToken,
//   //       );
//   //
//   //       final UserCredential userCredential =
//   //           await _auth.signInWithCredential(credentials);
//   //       final User? user = userCredential.user;
//   //
//   //       if (user != null) {
//   //
//   //         // Check if the user exists in Firestore
//   //         final userDoc = await _db.collection("Users").doc(AuthRepository.instance.authUser?.uid).get();
//   //         if (userDoc.exists) {
//   //           // User exists, proceed to the app
//   //
//   //
//   //           CM.showSnackBar(message: 'Successfully Login');
//   //           Get.offAllNamed(AppRoutes.navigationMenu);
//   //           // Navigate to the main part of your app
//   //         } else {
//   //
//   //           // User does not exist, sign out
//   //           print(1);
//   //           await _auth.signOut();
//   //           print(2);
//   //           await GoogleSignIn().signOut();
//   //
//   //           print(3);
//   //           await FirebaseAuth.instance.signOut();
//   //           print(4);
//   //           // await user.delete();
//   //           //  await _deleteUser(user);
//   //
//   //           CM.showSnackBar(
//   //               message:
//   //               'To proceed, please complete the registration process first');
//   //           // Once signed in return the UserCredential
//   //           return await _auth.signInWithCredential(credentials);
//   //         }
//   //       }
//   //
//   //     }
//   //
//   //
//   //
//   //
//   //   } on FirebaseAuthException catch (e) {
//   //     throw AppFirebaseAuthException(e.code).message;
//   //   } on FirebaseException catch (e) {
//   //     throw AppFirebaseException(e.code).message;
//   //   } on FormatException catch (_) {
//   //     throw const FormatExceptionHandler();
//   //   } on PlatformException catch (e) {
//   //     throw PlatformExceptionHandler(e.code).message;
//   //   } catch (e) {
//   //     throw 'An unknown error occurred: $e';
//   //   }
//   // }
//
//   // [Facebook Authentication] - FACEBOOK
//   // Future<UserCredential?> signInWIthGoogle() async {
//   //   try {// Initiate the Google sign-in process
//   //
//   //     // Trigger the authentication flow
//   //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//   //
//   //
//   //     if (userAccount == null) {
//   //       // The user canceled the sign-in
//   //       CM.showSnackBar(message: "Please register first to proceed");
//   //     }else{
//   //       //Obtain the auth details form the request
//   //       final GoogleSignInAuthentication? googleAccount =
//   //       await userAccount?.authentication;
//   //
//   //       // Create a new credential
//   //       final credentials = GoogleAuthProvider.credential(
//   //         accessToken: googleAccount?.accessToken,
//   //         idToken: googleAccount?.idToken,
//   //       );
//   //
//   //       final UserCredential userCredential =
//   //       await _auth.signInWithCredential(credentials);
//   //       final User? user = userCredential.user;
//   //
//   //       if (user != null) {
//   //
//   //         // Check if the user exists in Firestore
//   //         final userDoc = await _db.collection("Users").doc(AuthRepository.instance.authUser?.uid).get();
//   //         if (userDoc.exists) {
//   //           // User exists, proceed to the app
//   //
//   //
//   //           CM.showSnackBar(message: 'Successfully Login');
//   //           Get.offAllNamed(AppRoutes.navigationMenu);
//   //           // Navigate to the main part of your app
//   //         } else {
//   //
//   //           // User does not exist, sign out
//   //           print(1);
//   //           await _auth.signOut();
//   //           print(2);
//   //           await GoogleSignIn().signOut();
//   //
//   //           print(3);
//   //           await FirebaseAuth.instance.signOut();
//   //           print(4);
//   //           // await user.delete();
//   //           //  await _deleteUser(user);
//   //
//   //           CM.showSnackBar(
//   //               message:
//   //               'To proceed, please complete the registration process first');
//   //           // Once signed in return the UserCredential
//   //           return await _auth.signInWithCredential(credentials);
//   //         }
//   //       }
//   //
//   //     }
//   //
//   //
//   //
//   //
//   //   } on FirebaseAuthException catch (e) {
//   //     throw AppFirebaseAuthException(e.code).message;
//   //   } on FirebaseException catch (e) {
//   //     throw AppFirebaseException(e.code).message;
//   //   } on FormatException catch (_) {
//   //     throw const FormatExceptionHandler();
//   //   } on PlatformException catch (e) {
//   //     throw PlatformExceptionHandler(e.code).message;
//   //   } catch (e) {
//   //     throw 'An unknown error occurred: $e';
//   //   }
//   // }
//   //? ------------------------ END sign-in ---------------------------------------------------*/
//   // Future<UserCredential?> signInWIthGoogle() async {
//   //   try {// Initiate the Google sign-in process
//   //
//   //     // Trigger the authentication flow
//   //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//   //
//   //
//   //     if (userAccount == null) {
//   //       // The user canceled the sign-in
//   //       CM.showSnackBar(message: "Please register first to proceed");
//   //     }else{
//   //       //Obtain the auth details form the request
//   //       final GoogleSignInAuthentication? googleAccount =
//   //       await userAccount?.authentication;
//   //
//   //       // Create a new credential
//   //       final credentials = GoogleAuthProvider.credential(
//   //         accessToken: googleAccount?.accessToken,
//   //         idToken: googleAccount?.idToken,
//   //       );
//   //
//   //       final UserCredential userCredential =
//   //       await _auth.signInWithCredential(credentials);
//   //       final User? user = userCredential.user;
//   //
//   //       if (user != null) {
//   //
//   //         // Check if the user exists in Firestore
//   //         final userDoc = await _db.collection("Users").doc(AuthRepository.instance.authUser?.uid).get();
//   //         if (userDoc.exists) {
//   //           // User exists, proceed to the app
//   //
//   //
//   //           CM.showSnackBar(message: 'Successfully Login');
//   //           Get.offAllNamed(AppRoutes.navigationMenu);
//   //           return await _auth.signInWithCredential(credentials);
//   //           // Navigate to the main part of your app
//   //         } else {
//   //
//   //           // User does not exist, sign out
//   //           print(1);
//   //           await _auth.signOut();
//   //           print(2);
//   //           await GoogleSignIn().signOut();
//   //
//   //           print(3);
//   //           await FirebaseAuth.instance.signOut();
//   //           print(4);
//   //           // await user.delete();
//   //           //  await _deleteUser(user);
//   //
//   //           CM.showSnackBar(
//   //               message:
//   //               'To proceed, please complete the registration process first');
//   //           // Once signed in return the UserCredential
//   //
//   //         }
//   //       }
//   //
//   //     }
//   //
//   //
//   //
//   //
//   //   } on FirebaseAuthException catch (e) {
//   //     throw AppFirebaseAuthException(e.code).message;
//   //   } on FirebaseException catch (e) {
//   //     throw AppFirebaseException(e.code).message;
//   //   } on FormatException catch (_) {
//   //     throw const FormatExceptionHandler();
//   //   } on PlatformException catch (e) {
//   //     throw PlatformExceptionHandler(e.code).message;
//   //   } catch (e) {
//   //     throw 'An unknown error occurred: $e';
//   //   }
//   // }
//
//   // Future<UserCredential?> signInWIthGoogle() async {
//   //   try {
//   //     // Trigger the Google sign-in process
//   //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   //
//   //     if (googleUser == null) {
//   //       // The user canceled the sign-in
//   //       CM.showSnackBar(message: "Please register first to proceed");
//   //       return null;
//   //     }
//   //
//   //     // Obtain the auth details from the request
//   //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//   //
//   //     // Create a new credential
//   //     final OAuthCredential credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth.accessToken,
//   //       idToken: googleAuth.idToken,
//   //     );
//   //
//   //     // Sign in the user with the credential
//   //     final UserCredential userCredential = await _auth.signInWithCredential(credential);
//   //     final User? user = userCredential.user;
//   //
//   //     if (user != null) {
//   //       // Check if the user exists in Firestore
//   //       final userDoc = await _db.collection("Users").doc(user.uid).get();
//   //
//   //       if (userDoc.exists) {
//   //         // User exists, proceed with login
//   //         CM.showSnackBar(message: 'Successfully Logged In');
//   //         Get.offAllNamed(AppRoutes.navigationMenu);
//   //         return userCredential;
//   //       } else {
//   //         // User does not exist, sign out and prompt registration
//   //         await _auth.signOut();
//   //         await GoogleSignIn().signOut();
//   //
//   //         CM.showSnackBar(
//   //           message: 'To proceed, please complete the registration process first',
//   //         );
//   //       }
//   //     }else{
//   //       await _auth.signOut();
//   //       await GoogleSignIn().signOut();
//   //     }
//   //   } on FirebaseAuthException catch (e) {
//   //     throw AppFirebaseAuthException(e.code).message;
//   //   } on FirebaseException catch (e) {
//   //     throw AppFirebaseException(e.code).message;
//   //   } on FormatException catch (_) {
//   //     throw const FormatExceptionHandler();
//   //   } on PlatformException catch (e) {
//   //     throw PlatformExceptionHandler(e.code).message;
//   //   } catch (e) {
//   //     throw 'An unknown error occurred: $e';
//   //   }
//   //   return null;
//   // }
//   Future<UserCredential?> signInWIthGoogle(GoRouter router,BuildContext context) async {
//     try {
//       // Trigger the Google sign-in process
//       print(1);
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//       if (googleUser == null) {
//         // The user canceled the sign-in
//         RegistrationController.showSnackBar(context, "Accept Privacy Policy & Terms of Use", isError: true);
//
//         SnackBar(content: Text("Please register first to proceed"),);
//
//         return null;
//       }
//       print(3);
//
//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//       print(4);
//       // Create a new credential
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       print(5);
//       // Sign in the user with the credential
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//       print(6);
//       final User? user = userCredential.user;
//
//       print(' --------${user?.email} and ${user?.displayName} , ${user?.phoneNumber}');
//       print(7);
//       if (user != null) {
//         // Fetch the FCM device token
//         String? deviceToken = await FirebaseMessaging.instance.getToken();
//
//         // Check if the user exists in Firestore
//         final userDoc = await _db.collection("Users").doc(user.uid).get();
//         print(8);
//         if (userDoc.exists) {
//           // User exists in Firestore
//           // Check if the device token already exists
//           List<dynamic> deviceTokens = userDoc['device_token'] ?? [];
//           bool status = userDoc['status'] ?? true;
//           if (status == true) {
//             if (deviceToken != null && !deviceTokens.contains(deviceToken)) {
//               // Store the new device token if it doesn't exist
//               await _db.collection("Users").doc(user.uid).update({
//                 'device_token': FieldValue.arrayUnion([deviceToken]),
//               });
//             }
//             print(9);
//             // Navigate to the home screen only on successful login
//             //CM.showSnackBar(message: 'Successfully Logged In');
//             SnackBar(content: Text("Successfully Logged In"),);
//             RegistrationController.showSnackBar(context, "Successfully Logged In", isError: false);
//
//             router.goNamed(RouteConstants.bottomNavigation);
//             return userCredential;
//           }else{
//
//             // CM.showSnackBar(
//             //     message:
//             //     'Your account has been blocked. For support, kindly reach out to the Mostly Event Team.',
//             //     duration: Duration(seconds: 4));
//
//
//           }
//         } else {
//           final newUser = UserModal(
//             status: true,
//             userData: UserData(
//               userId: userCredential.user!.uid.toString(),
//               name: user.displayName??'',
//               email: user.email??'',
//               phone: 0,
//               userImage: user.photoURL??'',
//               address: '',
//               createdAt: DateTime.now(),
//
//
//             ),
//
//             deviceToken: <String>[],
//
//
//           );
//           await userRepository.saveUserRecord(newUser);
//
//           await _db.collection("Users").doc(newUser.userData.userId).set(
//               newUser.toJson());
//           print(5);
//           router.goNamed(RouteConstants.bottomNavigation);
//           // User does not exist in Firestore, sign out and prompt registration
//
//
//           // CM.showSnackBar(
//           //   message:
//           //   'To proceed, please complete the registration process first',
//           // );
//         }
//       }
//     } on FirebaseAuthException catch (e) {
//       // Handle FirebaseAuth-specific exceptions
//       //CM.showSnackBar(message: 'Authentication error: ${e.message}');
//     } on FirebaseException catch (e) {
//       // Handle Firestore-specific exceptions
//      // CM.showSnackBar(message: 'Firestore error: ${e.message}');
//     } catch (e,stackTrace) {
//       // Handle any other generic errors
//       print('google sigin error ${e} and $stackTrace ');
//      // CM.showSnackBar(message: 'An error occurred: $e');
//     }
//
//     // Return null if the login process fails
//     return null;
//   }
//
//   // [LogoutUser] - valid for any authentication.
//   Future<void> logout(BuildContext context) async {
//     try {
//       // Fetch the current user
//       final User? user = FirebaseAuth.instance.currentUser;
//
//       // Fetch the current FCM device token
//       print(1);
//       String? deviceToken = await FirebaseMessaging.instance.getToken();
//       print(2);
//       if (user != null && deviceToken != null) {
//         // Remove the device token from Firestore
//         final userDocRef =
//         FirebaseFirestore.instance.collection('Users').doc(user.uid);
//         print(3);
//         await userDocRef.update({
//           'device_token': FieldValue.arrayRemove([deviceToken])
//         });
//       }
//       print(4);
//       // Sign out from Google Sign-In if applicable
//       await GoogleSignIn().signOut();
//       print(5);
//       // Clear local storage (if needed)
//       // await AppLocalStorage.instance().clearAll();
//
//       // Sign out from Firebase Auth
//       await FirebaseAuth.instance.signOut();
//       print(6);
//
//       GoRouter.of(context).goNamed(RouteConstants.login);
//       RegistrationController.showSnackBar(context, "Successfully Logged Out", isError: false);
//
//       print(7);
//       // Navigate to the sign-in screen
//
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//
//   Future<void> logoutFromVirfyScreen() async {
//     try {
//       await GoogleSignIn().signOut();
//       await FirebaseAuth.instance.signOut();
//      // Get.offAll(() => const SignInScreen());
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//
//   // [Delete User] - Remove user auth & Firebase account.
//   Future<void> deleteAccount() async {
//     try {
//       await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
//       await _auth.currentUser?.delete();
//     //  Get.offAll(() => const SignInScreen());
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
//
//   // [Change Password] - Change user password
//   Future<void> changePassword(String oldPassword, newPassword) async {
//     try {
//       // Create a credential
//       AuthCredential credential = EmailAuthProvider.credential(
//         email: _auth.currentUser!.email!,
//         password: oldPassword,
//       );
//       // Verifing User and If Verified Updating Password
//       await _auth.currentUser?.reauthenticateWithCredential(credential).then(
//             (value) =>
//             _auth.currentUser?.updatePassword(newPassword).then((value) {
//               // Redirecting
//               Get.back();
//             }),
//       );
//     } on FirebaseAuthException catch (e) {
//       throw AppFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       throw 'An unknown error occurred: $e';
//     }
//   }
// }
