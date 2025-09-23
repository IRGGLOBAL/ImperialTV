import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Paddings/AppPaddings.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/text_strings.dart';
import '../controller/auth_controller.dart';
import 'add_fingerpring.dart';

class ScanFaceView extends StatelessWidget {
  const ScanFaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AuthController c = Get.put(AuthController());

    final double frameWidth = MediaQuery.of(context).size.width * 0.72;
    final double frameHeight = frameWidth; // square scan area

    return Scaffold(
      backgroundColor: MyColor.borderColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: AppText(text: ''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),

      ),

      body: SafeArea(
        child: Column(
          children: [
            /// Scanner area (wrapped in Expanded so it takes available space)
            Expanded(
              child: SizedBox(
                height: frameHeight + 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Camera view
                    Positioned.fill(
                      child: ClipRect(
                        child: MobileScanner(
                          onDetect: (BarcodeCapture capture) {
                            final barcodes = capture.barcodes;
                            if (barcodes.isNotEmpty) {
                              final barcode = barcodes.first;
                              if (barcode.rawValue != null) {
                                debugPrint('${MyStrings.login.tr} ${barcode.rawValue}');
                                Get.snackbar(
                                  MyStrings.login.tr,
                                  barcode.rawValue!,
                                  snackPosition: SnackPosition.TOP,
                                  duration: const Duration(seconds: 1),
                                );
                              }
                            }
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: frameWidth,
                        height: frameHeight,
                        child: CustomPaint(
                          painter: _CornerPainter(
                            color: MyColor.colorWhite,
                            strokeWidth: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Bottom button row
            Container(
              decoration: BoxDecoration(
                color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(30), // pill shape
              ),
              padding:  EdgeInsets.symmetric(horizontal: 0,vertical: 5),
              margin: const EdgeInsets.only(bottom: 20,left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(
                    assetPath:  MyImages.refresh,
                    backgroundColor: MyColor.borderColor,
                    iconColor: MyColor.primaryColor,
                    onTap: () {
                      // Refresh action
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildButton(
                    assetPath:  MyImages.camera,
                    backgroundColor: Colors.red,
                    iconColor: Colors.white,
                    onTap: () {
                      // Capture action
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildButton(
                    assetPath:  MyImages.check,
                    backgroundColor: MyColor.borderColor,
                    iconColor: MyColor.primaryColor,
                    onTap: () {
                      Get.to(()=> AddFingerpring());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildButton({
    required String assetPath,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30), // pill shape
        ),
        child:   Transform.scale(
          scale: 0.3,
          child: Image.asset(
            assetPath,
            width: 12,
            height: 12,
            color: iconColor,
          ),
        ),

      ),
    );
  }


}

// painter that draws corner L shapes for scanner frame
class _CornerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  _CornerPainter({required this.color, this.strokeWidth = 6});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double len = size.width * 0.12; // corner length relative to frame size
    // top-left
    canvas.drawLine(Offset(0, len), Offset(0, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(len, 0), paint);

    // top-right
    canvas.drawLine(Offset(size.width - len, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, len), paint);

    // bottom-left
    canvas.drawLine(Offset(0, size.height - len), Offset(0, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(len, size.height), paint);

    // bottom-right
    canvas.drawLine(Offset(size.width - len, size.height), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height - len), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) => false;
}




