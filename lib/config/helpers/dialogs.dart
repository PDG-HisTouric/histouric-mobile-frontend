import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dialogs {
  static void showGeneralDialog({
    required BuildContext context,
    required String title,
    required String content,
    String buttonText = "Aceptar",
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          FilledButton(
            onPressed: () => context.pop(),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
