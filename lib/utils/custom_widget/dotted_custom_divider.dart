import 'package:flutter/material.dart';

import 'my_color.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: Center(child: ExampleDivider()))));
}

class ExampleDivider extends StatelessWidget {
  const ExampleDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Above divider"),
        const SizedBox(height: 10),
        const DottedDivider(height: 1.5, spacing: 5, color: Colors.black),
        const SizedBox(height: 10),
        const Text("Below divider"),
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double spacing;

  const DottedDivider({
    this.color = MyColor.rideBorderColor,
    this.height = 1.3,
    this.spacing = 6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _DottedLinePainter(color: color, spacing: spacing, height: height),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double height;

  _DottedLinePainter({required this.color, required this.spacing, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = height;

    double startX = 0;
    const double dotWidth = 5;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dotWidth, 0), paint);
      startX += dotWidth + spacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
