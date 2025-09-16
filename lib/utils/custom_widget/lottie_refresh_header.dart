// lib/widgets/lottie_refresh_header.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LottieRefreshHeader extends StatelessWidget {
  final String lottieAsset;

  const LottieRefreshHeader({
    super.key,
    required this.lottieAsset,
  });

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (context, mode) {
        return SizedBox(
          height: 100,
          child: Center(
            child: Lottie.asset(
              lottieAsset,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              repeat: true,
            ),
          ),
        );
      },
    );
  }
}
