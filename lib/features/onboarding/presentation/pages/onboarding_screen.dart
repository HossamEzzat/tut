import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut/core/app_manager/colos_manager.dart';
import 'package:tut/core/app_manager/strings_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';

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
        title: StringsManager.onBoardingTitle1,
        subTitle: StringsManager.onBoardingSubTitle1,
        image: AssetsManager.onBoardingLogo1,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle2,
        subTitle: StringsManager.onBoardingSubTitle2,
        image: AssetsManager.onBoardingLogo2,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle3,
        subTitle: StringsManager.onBoardingSubTitle3,
        image: AssetsManager.onBoardingLogo3,
      ),
      SliderObject(
        title: StringsManager.onBoardingTitle4,
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
        itemBuilder: (BuildContext context, int index) {
          return OnBoardingPage(object: _list[index]);
        },
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject object;

  const OnBoardingPage({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            object.title,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppMargin.m20),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            object.subTitle,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppMargin.m20),
        SvgPicture.asset(object.image),
      ],
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
