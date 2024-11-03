import 'package:flutter/material.dart';

ButtonStyle outlineButtonStyle() {
  return OutlinedButton.styleFrom(
    fixedSize: const Size.fromWidth(250),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    backgroundColor: Colors.blue,
    disabledBackgroundColor: Colors.grey.shade400,
  );
}
