import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();

  static Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: LoadingDialog(),
        );
      });
  }

  static Future<void> hide(BuildContext context) async {
    Navigator.of(context).pop();
  }
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: AlertDialog(
          alignment: Alignment.center,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: _dialogContent(),
        ),
      ),
    );
  }

  Widget _dialogContent() {
    return const Column(
      children: [
        Spacer(),
        CircularProgressIndicator(),
        Spacer(),
        Text('ちょっとまってね'),
        Spacer(),
      ],
    );
  }
}
