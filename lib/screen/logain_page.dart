import 'package:flutter/material.dart';
import 'package:lymphoedemo/constant/const.dart';
import 'package:lymphoedemo/constant/dimentions.dart';
import 'package:lymphoedemo/screen/chose_blutooth_page.dart';
import 'package:lymphoedemo/screen/chose_exercise_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart' as AppSettings;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // 🔐 Hardcoded username & password (hashed)
  final String correctUsername = "admin";
  final String correctPasswordHash = "admin"; // Hash of "password"

  void _login() {
    String enteredUsername = _usernameController.text;
    String enteredPasswordHash = _passwordController.text;

    if (enteredUsername == correctUsername &&
        enteredPasswordHash == correctPasswordHash) {
      _showMessage("✅ تسجيل دخول ناجح!", Colors.green);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => ScanScreen()),
      );
    } else {
      _showMessage("❌ اسم المستخدم أو كلمة المرور غير صحيحة!", Colors.red);
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  Future<void> _requestBluetoothPermissions() async {
    if (await Permission.bluetooth.isDenied) {
      await Permission.bluetooth.request();
    }
    if (await Permission.bluetoothScan.isDenied) {
      await Permission.bluetoothScan.request();
    }
    if (await Permission.bluetoothConnect.isDenied) {
      await Permission.bluetoothConnect.request();
    }
    if (await Permission.bluetoothAdvertise.isDenied) {
      await Permission.bluetoothAdvertise.request();
    }
    if (await Permission.nearbyWifiDevices.isDenied) {
      await Permission.nearbyWifiDevices.request();
    }

    // Open App Settings if permissions are permanently denied
    if (await Permission.bluetooth.isPermanentlyDenied ||
        await Permission.bluetoothConnect.isPermanentlyDenied ||
        await Permission.bluetoothScan.isPermanentlyDenied ||
        await Permission.nearbyWifiDevices.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void initState() {
    _requestBluetoothPermissions();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: pColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: pColor),
              child: Center(
                child: Text(
                  "Lymphoedema",
                  style: TextStyle(
                    fontFamily: "Lemonada",
                    fontSize: Dimentions.fontPercentage(context, 5),
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Exercise",
                style: TextStyle(
                  fontFamily: "Lemonada",
                  fontSize: Dimentions.fontPercentage(context, 5),
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChoseExercisePage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: pColor,
      appBar: AppBar(
        backgroundColor: pColor,

        title: Center(
          child: Text(
            "Logain Page",
            style: TextStyle(
              fontFamily: "Lemonada",
              fontSize: Dimentions.fontPercentage(context, 5),
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimentions.hightPercentage(context, 3)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Dimentions.hightPercentage(context, 3)),

              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),

                  labelText: "UserName",

                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: Dimentions.hightPercentage(context, 3)),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: Dimentions.hightPercentage(context, 3)),
              ElevatedButton(onPressed: _login, child: const Text("Logain")),
            ],
          ),
        ),
      ),
    );
  }
}
