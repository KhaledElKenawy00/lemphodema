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
    final scnProviderBlue = Provider.of<ScanProvider>(context);

    return Scaffold(
      backgroundColor: pColor,
      appBar: AppBar(
        backgroundColor: pColor,
        title: Column(
          children: [
            Text(
              "Patient Data",
              style: TextStyle(
                fontFamily: "Lemonada",
                fontSize: Dimentions.fontPercentage(context, 5),
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body:
          scnProviderBlue.isConnected
              ? StreamBuilder<Map<String, dynamic>>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var jsonData = snapshot.data!;

                  return Column(
                    children: [
                      SizedBox(height: Dimentions.hightPercentage(context, 5)),

                      /// **Body Temperature Section**
                      _buildDataContainer(
                        context,
                        title: "Body Temperature",
                        value: jsonData["temperature"].toString(),
                        assetPath: "assets/temp.png",
                      ),

                      SizedBox(height: Dimentions.hightPercentage(context, 2)),

                      /// **Pressure Section**
                      _buildDataContainer(
                        context,
                        title: "Pressure",
                        value: jsonData["pressure"].toString(),
                        assetPath: "assets/presu.png",
                      ),
                    ],
                  );
                },
              )
              : Center(
                child: Text(
                  """Not Connected 🔌🔌 Please Close app and Restart""",
                  style: TextStyle(
                    fontSize: Dimentions.fontPercentage(context, 4),
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
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
      margin: EdgeInsets.all(Dimentions.hightPercentage(context, 1)),
      height: Dimentions.hightPercentage(context, 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 133, 126, 126),
        borderRadius: BorderRadius.circular(
          Dimentions.radiusPercentage(context, 3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimentions.widthPercentage(context, 5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Padding(
            padding: EdgeInsets.only(
              right: Dimentions.widthPercentage(context, 5),
            ),
            child: Image.asset(
              assetPath,
              height: Dimentions.hightPercentage(context, 15),
            ),
          ),
        ],
      ),
    );
  }
}
