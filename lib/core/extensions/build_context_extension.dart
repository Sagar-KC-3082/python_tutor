import 'package:flutter/material.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/27/2024, Thursday

extension BuildContextExtension on BuildContext {
  showSnackBar(String message, {bool? isSuccess}) {
    return ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(
          bottom: 16,
          right: 8,
          left: 8,
        ),
        backgroundColor: isSuccess == true ? Colors.green : Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )));
  }
}
