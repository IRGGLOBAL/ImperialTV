import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'exitwidget.dart';

class WillPopWidget extends StatelessWidget {
  final Widget child;
  final String nextRoute;

  const WillPopWidget({super.key, required this.child, this.nextRoute = ''});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true, // Allow popping if there's a previous screen
        onPopInvokedWithResult: (bool didPop, d) async {
          if (didPop) return;

          if (Navigator.of(context).canPop()) {
            Get.back(); // Navigate to the previous screen
          } else if (nextRoute.isEmpty) {
            showExitDialog(context); // Show exit dialog if no previous screen
          } else {
            if (nextRoute == 'maintenance') {
              SystemNavigator.pop(); // Close the app
            } else {
              Get.offAndToNamed(nextRoute); // Navigate to the specified route
            }
          }
        },
        child: child);
  }
}