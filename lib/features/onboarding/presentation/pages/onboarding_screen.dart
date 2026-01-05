import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut/core/app_manager/colos_manager.dart';
import 'package:tut/core/app_manager/routes_manager.dart';
import 'package:tut/core/app_manager/strings_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';

import '../../../../core/app_manager/assest_manager.dart';
import '../../../../core/app_manager/constants_manager.dart';

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
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1,
        image: AssetsManager.onBoardingLogo1,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2,
        image: AssetsManager.onBoardingLogo2,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTitle3,
        image: AssetsManager.onBoardingLogo3,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle4,
        subTitle: AppStrings.onBoardingSubTitle4,
        image: AssetsManager.onBoardingLogo4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        elevation: AppSize.s0,
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
      bottomSheet: Container(
        color: ColorsManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesManager.loginRoute,
                  );
                },
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Container(
              color: ColorsManager.darkPrimary,
              child: _bottomSheetWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: GestureDetector(
            onTap: () {
              pageController.previousPage(
                duration: const Duration(
                  milliseconds: ConstantsManager.sliderDelay,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(AssetsManager.leftArrow),
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: getPropperCircular(i),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: GestureDetector(
            onTap: () {
              pageController.nextPage(
                duration: const Duration(
                  milliseconds: ConstantsManager.sliderDelay,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(AssetsManager.rightArrow),
            ),
          ),
        ),
      ],
    );
  }

  Widget getPropperCircular(int index) {
    if (currentIndex == index) {
      return SvgPicture.asset(AssetsManager.solidCircular);
    } else {
      return SvgPicture.asset(AssetsManager.hollowCircle);
    }
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
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            object.subTitle,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
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
