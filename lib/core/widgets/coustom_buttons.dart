import 'package:flutter/material.dart';
import 'package:NovaHealth/core/utils/size_config.dart';

class CoustomGeneralButtons extends StatelessWidget {
  const CoustomGeneralButtons({super.key, this.text, required this.onTap});
  final String? text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      height: 60,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: Color(0xff2D84FB), borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ), // TextStyle
          textAlign: TextAlign.left,
        ), // Text
      ), 
    ),// Center,
    );
  }
}
