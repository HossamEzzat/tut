import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut/core/app_manager/colos_manager.dart';
import 'package:tut/core/app_manager/strings_manager.dart';

import '../../../../core/app_manager/assest_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final List<SliderObject> _list = _getSliderData();
  PageController pageController = PageController();
  int currentIndex = 0;

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        title: StringsManager.onBoardingSubTitle1,
        subTitle: StringsManager.onBoardingSubTitle1,
        image: AssetsManager.onBoardingLogo1,
      ),
      SliderObject(
        title: StringsManager.onBoardingSubTitle2,
        subTitle: StringsManager.onBoardingSubTitle2,
        image: AssetsManager.onBoardingLogo2,
      ),
      SliderObject(
        title: StringsManager.onBoardingSubTitle3,
        subTitle: StringsManager.onBoardingSubTitle3,
        image: AssetsManager.onBoardingLogo3,
      ),
      SliderObject(
        title: StringsManager.onBoardingSubTitle4,
        subTitle: StringsManager.onBoardingSubTitle4,
        image: AssetsManager.onBoardingLogo4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColosManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {},
      ),
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
