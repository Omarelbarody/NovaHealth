import 'package:NovaHealth/features/on%20Bording/presentation/wiggets/page_view_item.dart';
import 'package:flutter/material.dart';

class CoustomPageView extends StatelessWidget {
  const CoustomPageView({super.key,@required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:pageController ,
      children: [
        PageViewItem(
          image: 'assets/images/o1.png',
          title:'Welcome to Nova Health' ,
          subTitle:'',
        ),
        PageViewItem(
          image: 'assets/images/o2.png',
          title:'Schedule Appointments' ,
          subTitle:'Book appointments with doctors, labs, and radiology instantly, all from your phone.' ,
        ),
        PageViewItem(
          image:'assets/images/o3.png' ,
          title:' Nova Health AI' ,
          subTitle:'Tell us your symptoms, and well guide you to the right department for care.' ,
        ),
      ],
    );
  }
}