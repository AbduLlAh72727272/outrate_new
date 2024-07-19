import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  final String assetName;
  final double size;
  final Color? color;

  const AssetIcon({
    Key? key,
    required this.assetName,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      width: size,
      height: size,
      color: color,
    );
  }
}
