import 'package:flutter/material.dart';
import 'package:lymphoedemo/constant/const.dart';
import 'package:lymphoedemo/provider/scan_bluetooth_provider.dart';
import 'package:lymphoedemo/screen/patient_data_page.dart';
import 'package:provider/provider.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  // This flag ensures that navigation happens only once.
  bool _navigated = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scanProvider = Provider.of<ScanProvider>(context);
    if (scanProvider.isConnected && !_navigated) {
      _navigated = true;
      // Use a post frame callback to safely trigger navigation after build.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PatientDataPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        backgroundColor: pColor,
        title: const Center(child: Text('Select Bluetooth Device')),
      ),
      body:
          scanProvider.device == null
              ? const Center(child: Text('No paired device found'))
              : Center(
                child: ListTile(
                  title: Text(scanProvider.device!.name ?? 'Unknown Device'),
                  subtitle: Text(scanProvider.device!.address),
                  trailing:
                      scanProvider.isConnected
                          ? const Icon(
                            Icons.bluetooth_connected,
                            color: Colors.green,
                          )
                          : const Icon(Icons.bluetooth, color: Colors.grey),
                  onTap:
                      scanProvider.isConnected
                          ? null
                          : () {
                            scanProvider.connectToDevice();
                          },
                ),
              ),
    );
  }
}
