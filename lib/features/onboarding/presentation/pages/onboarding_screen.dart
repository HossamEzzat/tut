import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut/core/app_manager/assets_manager.dart';
import 'package:tut/core/app_manager/colors_manager.dart';
import 'package:tut/core/app_manager/constants_manager.dart';
import 'package:tut/core/app_manager/routes_manager.dart';
import 'package:tut/core/app_manager/strings_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';
import 'package:tut/features/onboarding/domain/entities/slider_object.dart';
import 'package:tut/core/di/di.dart';
import 'package:tut/features/onboarding/presentation/manager/onboarding_viewmodel.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final OnboardingViewModel _viewModel = instance<OnboardingViewModel>();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: AppBar(
          backgroundColor: ColorsManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (BuildContext context, int index) {
            return OnBoardingPage(object: sliderViewObject.sliderObject);
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
                child: _bottomSheetWidget(sliderViewObject),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _bottomSheetWidget(SliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goPrevious(),
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
            for (int i = 0; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: getPropperCircular(i, sliderViewObject.currentIndex),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goNext(),
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

  Widget getPropperCircular(int index, int currentIndex) {
    if (currentIndex == index) {
      return SvgPicture.asset(AssetsManager.solidCircular);
    } else {
      return SvgPicture.asset(AssetsManager.hollowCircle);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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
        const SizedBox(height: AppSize.s40),
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
