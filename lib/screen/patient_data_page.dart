import 'package:flutter/material.dart';
import 'package:lymphoedemo/constant/const.dart';
import 'package:lymphoedemo/constant/dimentions.dart';
import 'package:lymphoedemo/provider/scan_bluetooth_provider.dart';
import 'package:provider/provider.dart';

class PatientDataPage extends StatelessWidget {
  const PatientDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataStream = context.watch<ScanProvider>().dataStream;
    final scanProviderBlue = Provider.of<ScanProvider>(context);

    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        backgroundColor: pColor,
        title: Text(
          "Patient Data",
          style: TextStyle(
            fontFamily: "Lemonada",
            fontSize: Dimentions.fontPercentage(context, 5),
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          scanProviderBlue.isConnected
              ? StreamBuilder<Map<String, dynamic>>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var jsonData = snapshot.data!;

                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimentions.hightPercentage(context, 2),
                      horizontal: Dimentions.widthPercentage(context, 5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// **Body Temperature Section**
                        _buildDataContainer(
                          context,
                          title: "Body Temperature",
                          value: jsonData["temperature"].toString(),
                          assetPath: "assets/temp.png",
                        ),
                        SizedBox(
                          height: Dimentions.hightPercentage(context, 2),
                        ),

                        /// **Pressure Section**
                        _buildDataContainer(
                          context,
                          title: "Pressure",
                          value: jsonData["pressure"].toString(),
                          assetPath: "assets/presu.png",
                        ),
                      ],
                    ),
                  );
                },
              )
              : Center(
                child: Padding(
                  padding: EdgeInsets.all(
                    Dimentions.widthPercentage(context, 5),
                  ),
                  child: Text(
                    "Not Connected 🔌🔌 Please Close app and Restart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Dimentions.fontPercentage(context, 4),
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
    );
  }

  /// **Reusable Container for Displaying Data**
  Widget _buildDataContainer(
    BuildContext context, {
    required String title,
    required String value,
    required String assetPath,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimentions.hightPercentage(context, 1),
      ),
      padding: EdgeInsets.all(Dimentions.widthPercentage(context, 4)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 133, 126, 126),
        borderRadius: BorderRadius.circular(
          Dimentions.radiusPercentage(context, 3),
        ),
      ),
      child: Row(
        children: [
          /// **Text Section**
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Dimentions.fontPercentage(context, 4),
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimentions.hightPercentage(context, 1)),
                Text(
                  "Value: $value",
                  style: TextStyle(
                    fontFamily: "Lemonada",
                    fontSize: Dimentions.fontPercentage(context, 4),
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// **Image Section**
          Image.asset(
            assetPath,
            height: Dimentions.hightPercentage(context, 12),
            width: Dimentions.widthPercentage(context, 23),
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
