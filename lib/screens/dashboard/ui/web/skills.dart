import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widgets/SectioinTitleWidget.dart';


///About me part of dashboard screen
class Skills extends StatelessWidget {
  ///Class constructor
  Skills({Key? key,required this.isWeb}) : super(key: key);
  bool isWeb = true;

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.primary,
      width: double.infinity,
      child: Column(
        children: [
          SectionTitleWidget(title: 'SKILLS',isWeb: isWeb,textSize: isWeb ? 30 : 15,),
          SizedBox(height: Get.height*0.1,),
          skillsUI('USING NOW:'),
          SizedBox(height: Get.height*0.1,),
          skillsUI('LEARNING:'),
          SizedBox(height: Get.height*0.1,),
          skillsUI('OTHER SKILLS:'),
          SizedBox(height: Get.height*0.1,),
        ],
      ),
    );
  }

  Widget skillsUI(String title){
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth > 1150){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Container(
              width: Get.width/2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(title,style: Get.textTheme.bodyLarge!.copyWith(fontSize: 25),)).
                  paddingOnly(left: Get.width*0.03,bottom: Get.height*0.06),
                  SizedBox(
                    height: Get.height*0.5,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // number of items in each row
                          mainAxisSpacing: 8.0, // spacing between rows
                          crossAxisSpacing: 8.0, // spacing between columns
                          childAspectRatio: 3/2.8
                      ),
                      //padding: EdgeInsets.all(8.0), // padding around the grid
                      itemCount: _homeController.usingNowSkillsName.length, // total number of items
                      itemBuilder: (context, index) {
                        return skillWithName(_homeController.usingNowSkillsName[index].image,
                            _homeController.usingNowSkillsName[index].name);
                      },
                    ),
                  )
                  /* Wrap(
                children: _homeController.usingNowSkillsName.map((element) =>
                skillWithName(element.image, element.name)).toList(),
              )*/
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        );
      }
      else{
        return skillsMobileView(title);
      }
    });
  }

  Widget skillsMobileView(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: Get.textTheme.bodyLarge!.copyWith(fontSize: 25),),
        Column(
          children: _homeController.usingNowSkillsName.map((element) =>
              skillWithName(element.image, element.name)).toList(),
        )
      ],
    );
  }

  Widget skillWithName(String img,String name){
    return Column(
      children: [
        SizedBox(
            height: 80,width: 70,
            child: Image.asset(img)).paddingOnly(bottom: 8
        ),
        Text(name,style: Get.textTheme.bodySmall!.copyWith(fontSize: 20),),
      ],
    )/*.paddingOnly(right: Get.width*0.03,left: Get.width*0.03,bottom: Get.width*0.03)*/;
  }
}


