import 'package:flutter/material.dart';

import 'mobile/home_screen.dart';
import 'web/home_screen_web.dart';

///My home screen ui calss
class CheckScreen extends StatelessWidget {
  ///Home screen super constructor
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
         if(constraints.maxWidth > 1150)
           {
             return HomeScreenWeb();
           }else{
           return HomeScreenMobile();
         }
      },

      ),
    );
  }
}
