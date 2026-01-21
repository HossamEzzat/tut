import 'dart:async';

import 'package:tut/core/app_manager/assets_manager.dart';
import 'package:tut/core/app_manager/strings_manager.dart';
import 'package:tut/core/base_view_model/base_view_model.dart';
import 'package:tut/features/onboarding/domain/entities/slider_object.dart';

class OnboardingViewModel extends BaseViewModel
    implements OnboardingViewModelInputs, OnboardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    // send this slider data to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++; // +1
    if (nextIndex >= _list.length) {
      _currentIndex =
          0; // infinite loop to go to first item if the list is ended
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--; // -1
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; // infinite loop to go to the length of list - 1
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // private functions
  List<SliderObject> _getSliderData() => [
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

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(_list[_currentIndex], _list.length, _currentIndex),
    );
  }
}

// inputs mean the orders that our view model will receive from our view
abstract class OnboardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left.
  void goPrevious(); // when user clicks on left arrow or swipe right.
  void onPageChanged(int index);

  Sink
  get inputSliderViewObject; // this is the way to add data to the stream .. content of stream
}

// outputs mean data or results that will be sent from our view model to our view
abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
