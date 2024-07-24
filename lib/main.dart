import 'package:flutter/material.dart';
import 'package:otp_autofill_detection/send_oto.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  SendOTPScreen(),
     );
  }
}
