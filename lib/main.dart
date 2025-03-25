import 'package:flutter/material.dart';
import 'package:lymphoedemo/provider/scan_bluetooth_provider.dart';
import 'package:lymphoedemo/screen/logain_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(Lymphoedemo());
}

class Lymphoedemo extends StatelessWidget {
  const Lymphoedemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ScanProvider())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage()),
    );
  }
}
