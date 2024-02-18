import 'package:flutter/material.dart';
import '../../widgets/SectioinTitleWidget.dart';



class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/icons/portfolio_bg.png'),
            SectionTitleWidget(title: 'PORTFOLIO',isWeb: true,),
          ],
        )
      ],
    );
  }
}
