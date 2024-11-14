// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'package:path/path.dart' as Path;
//
// import '../exceptions/firebase_exception.dart';
// import '../exceptions/format_exception.dart';
// import '../exceptions/platform_exception_handler.dart';
//
// import '../models/userModal.dart';
// import 'auth_repository.dart';
//
// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();
//
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
//   // Function to store user data in Firestore.
//   Future<void> saveUserRecord(UserModal user) async {
//     try {
//       await _db.collection("Users").doc(user.userData!.userId).set(
//           user.toJson());
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       print(e);
//       throw 'Something wen wrong. Please try again';
//     }
//   }
//
//   // Function to fetch store data based on id,
//   Future<UserModal> fetchUserDetails() async {
//     try {
//       final documentSnapshot = await _db
//           .collection("Users")
//           .doc(AuthRepository.instance.authUser?.uid)
//           .get();
//
//       if (documentSnapshot.exists) {
//         return UserModal.fromSnapshot(documentSnapshot);
//       } else {
//         return UserModal.empty();
//       }
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e, stackTrace) {
//       print('feching the data $e $stackTrace');
//       print(e);
//       throw 'Something wen wrong. Please try again';
//     }
//   }
//
//   // Function to update store data in Firestore.
//   Future<void> updateUserDetails(UserModal updatedUser) async {
//     try {
//       await _db
//           .collection("Users")
//           .doc(updatedUser.userData!.userId)
//           .update(updatedUser.toJson());
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       print(e);
//       throw 'Something wen wrong. Please try again';
//     }
//   }
//
//   // Update any field in specific Store Collections
//   Future<void> updateSingleField(Map<String, dynamic> json) async {
//     try {
//       await _db
//           .collection("Users")
//           .doc(AuthRepository.instance.authUser?.uid)
//           .update(json).then((_) {
//         print("User data updated successfully");
//       });
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       print(e);
//       throw 'Something wen wrong. Please try again';
//     }
//   }
//
//   // Function to remove Store date from firestore.
//   Future<void> removeUserRecord(String userId) async {
//     try {
//       await _db.collection("Users").doc(userId).delete();
//     } on FirebaseException catch (e) {
//       throw AppFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const FormatExceptionHandler();
//     } on PlatformException catch (e) {
//       throw PlatformExceptionHandler(e.code).message;
//     } catch (e) {
//       print(e);
//       throw 'Something wen wrong. Please try again';
//     }
//   }
//
//
// //Upload any Image
// Future<String> uploadImage(String path, XFile image) async {
//   try {
//     final ref = FirebaseStorage.instance.ref(path).child(image.name);
//     await ref.putFile(File(image.path));
//     final url = await ref.getDownloadURL();
//     return url;
//   } on FirebaseException catch (e) {
//     throw AppFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw const FormatExceptionHandler();
//   } on PlatformException catch (e) {
//     throw PlatformExceptionHandler(e.code).message;
//   } catch (e) {
//     print(e);
//     throw 'Something wen wrong. Please try again';
//   }
// }
//
// // Upload List of Images and Give List of downloaded Urls
// Future<List<String>> uploadImages(List<XFile> images) async {
//   List<String> downloadUrls = [];
//   for (int i = 0; i < images.length; i++) {
//     String url = await uploadImage("Users/KYC/Documents/", images[i]);
//     downloadUrls.add(url);
//   }
//   return downloadUrls;
// }
//
// }
//
