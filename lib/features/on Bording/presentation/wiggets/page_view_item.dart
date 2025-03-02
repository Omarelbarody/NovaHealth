import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, this.title, this.subTitle, this.image});
final String? title;
final String? subTitle; 
final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      const VerticallSpace(15),

      SizedBox( height: SizeConfig.defaultSize! *30, child: Image.asset(image!)),
      const VerticallSpace(6),
      Text(
      title!,
       style: TextStyle(
       fontFamily: 'Poppins', 
       fontSize: 22,
      color: const Color (0xff000000), 
      fontWeight: FontWeight.w600,
      ), // TextStyle
      textAlign: TextAlign.left,
      ), 
      const VerticallSpace(2),// Text
      Center(
    child: Text(
      subTitle!,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.normal, // Bold text
        color: Color(0xff000000),
      ),
      textAlign: TextAlign.center, // Center text inside the widget
    ),
  )
// Text

      ],
    );
  }
}