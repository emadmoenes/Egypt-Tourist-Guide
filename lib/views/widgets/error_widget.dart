import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String? errorMessage;
  const AppErrorWidget({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Text(
          "An error occurred. Please try again later.\n${errorMessage ?? "Unknown error"}",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
      ),
    );
  }
}
