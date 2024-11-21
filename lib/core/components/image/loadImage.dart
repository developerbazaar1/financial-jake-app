import 'package:flutter/material.dart';

Future<bool> loadNetworkImage(String imageUrl) async {
  if (imageUrl.isEmpty) return false;
  try {
    final response =
        await NetworkImage(imageUrl).obtainKey(const ImageConfiguration());
    return response != null;
  } catch (e) {
    return false;
  }
}
