import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  final String ImagePath;

  const TopImage({super.key, required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}
