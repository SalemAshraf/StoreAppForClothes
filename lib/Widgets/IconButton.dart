import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  String path;
  double? width;
  Color? color;
  Function? onPressed;
  IconButtonWidget({required this.path, this.width, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: () {},
              icon: Image.asset(
                path,
                width: width,
                color: color,
              ),
            );
  }
}