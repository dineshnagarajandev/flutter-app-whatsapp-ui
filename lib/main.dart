import 'package:flutter/material.dart';
import 'package:flutter_app_whatsapp_ui/WhatsApp/whats_app_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WhatsAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
