import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';

class ScanProvider extends ChangeNotifier {
  final BluetoothClassic _bluetooth = BluetoothClassic();
  StreamController<Map<String, dynamic>>? _dataStreamController;
  StreamSubscription<Uint8List>? _dataSubscription;
  StreamSubscription<int>? _statusSubscription;

  Device? _device;
  bool isConnected = false;
  String buffer = "";
  final String targetDeviceAddress = "98:D3:02:96:50:91";

  ScanProvider() {
    _getPairedDevice();
  }

  /// Exposes the stream of JSON data received from the Bluetooth device.
  Stream<Map<String, dynamic>> get dataStream {
    _dataStreamController ??=
        StreamController<Map<String, dynamic>>.broadcast();
    return _dataStreamController!.stream;
  }

  /// Returns the paired Bluetooth device (if found).
  Device? get device => _device;

  /// Get the target paired device
  void _getPairedDevice() async {
    await _bluetooth.initPermissions();
    List<Device> devices = await _bluetooth.getPairedDevices();
    for (var dev in devices) {
      if (dev.address == targetDeviceAddress) {
        _device = dev;
        notifyListeners();
        break;
      }
    }
  }

  /// Initiates the connection to the device.
  void connectToDevice() async {
    if (_device == null) {
      print('⚠️ No device available to connect');
      return;
    }

    // Prevent multiple connections
    if (isConnected) {
      print('⚠️ Already connected');
      return;
    }

    try {
      await _bluetooth.connect(
        _device!.address,
        "00001101-0000-1000-8000-00805f9b34fb",
      );
      isConnected = true;
      notifyListeners();
      print('✅ Connected to ${_device!.address}');

      _dataStreamController ??=
          StreamController<Map<String, dynamic>>.broadcast();

      // Cancel any existing subscriptions before creating new ones
      _dataSubscription?.cancel();
      _statusSubscription?.cancel();

      // Listen for incoming data
      _dataSubscription = _bluetooth.onDeviceDataReceived().listen((
        Uint8List data,
      ) {
        String receivedData = utf8.decode(data);
        buffer += receivedData;

        // Extract JSON objects from the buffer
        RegExp jsonPattern = RegExp(r'\{.*?\}');
        Iterable<Match> matches = jsonPattern.allMatches(buffer);

        for (var match in matches) {
          String completeMessage = match.group(0)!;
          print('📥 Extracted JSON: $completeMessage');

          try {
            Map<String, dynamic> jsonData = json.decode(completeMessage);
            _dataStreamController?.add(jsonData);
          } catch (e) {
            print('❌ JSON Parsing Error: $e');
          }
        }

        // Remove processed JSON from buffer
        buffer = buffer.substring(buffer.lastIndexOf("}") + 1);
      });

      // Listen for device status changes
      _statusSubscription = _bluetooth.onDeviceStatusChanged().listen((
        int status,
      ) {
        if (status == 0) {
          print('🔌 Disconnected');
          disconnect();
        }
      });
    } catch (e) {
      print('❌ Connection Failed: $e');
    }
  }

  /// Disconnect from the device
  void disconnect() async {
    if (!isConnected) {
      print('⚠️ No active connection to disconnect.');
      return;
    }

    try {
      await _bluetooth.disconnect();
      isConnected = false;

      // Close and reinitialize the data stream controller
      _dataStreamController?.close();
      _dataStreamController = null;

      // Cancel listeners
      _dataSubscription?.cancel();
      _statusSubscription?.cancel();
      _dataSubscription = null;
      _statusSubscription = null;

      notifyListeners();
      print('🔌 Disconnected');
    } catch (e) {
      print('❌ Error during disconnection: $e');
    }
  }

  @override
  void dispose() {
    disconnect();
    super.dispose();
  }
}
