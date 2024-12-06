import 'package:flutter/material.dart';
import '../utils/appTheme.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppTheme.appBarColor,
        title: const Text(
          "REGISTRATION FORM",
          style: TextStyle(
            color: AppTheme.titleColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FORM SUBMITTED\nSUCCESSFULLY",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We have received your form submission.\nYou can fill another form again.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.titleColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              side: BorderSide.none,
              elevation: 0.0,
              backgroundColor: AppTheme.titleColor,
              minimumSize: const Size.fromHeight(50),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text("Fill a form"),
          ),
        ),
      ),
    );
  }
}
