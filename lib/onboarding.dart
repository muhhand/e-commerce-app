import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatefulWidget {


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  int splashtime = 5;


  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
        //pushReplacement = replacing the route so that
        //splash screen won't show on back button press
        //navigation to Home page.
          builder: (context){
            return ControlView();
          }));
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: 'Gg Store',fontSize: 52,alignment: Alignment.center,color: Colors.white,),
                SizedBox(height: 30,),
                SvgPicture.asset('assets/images/undrow.svg',height: 200,width: 200,),
                SizedBox(height: 15,),
                CustomText(text: 'Loading...',fontSize: 22,alignment: Alignment.center,color: Colors.white,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
