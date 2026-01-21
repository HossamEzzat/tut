import 'package:get_it/get_it.dart';
import 'package:tut/features/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:tut/features/forget_password/data/repositories/forget_password_repository_impl.dart';
import 'package:tut/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:tut/features/forget_password/domain/use_cases/forget_password_usecase.dart';
import 'package:tut/features/forget_password/presentation/manager/forget_password_viewmodel.dart';
import 'package:tut/features/login/data/data_sources/remote_data_source.dart';
import 'package:tut/features/login/data/repositories/login_repository_impl.dart';
import 'package:tut/features/login/domain/repositories/login_repository.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';
import 'package:tut/features/login/presentation/manager/login_viewmodel.dart';
import 'package:tut/features/main/presentation/manager/main_viewmodel.dart';
import 'package:tut/features/onboarding/presentation/manager/onboarding_viewmodel.dart';
import 'package:tut/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:tut/features/register/data/repositories/register_repository_impl.dart';
import 'package:tut/features/register/domain/repositories/register_repository.dart';
import 'package:tut/features/register/domain/use_cases/register_usecase.dart';
import 'package:tut/features/register/presentation/manager/register_viewmodel.dart';
import 'package:tut/features/splash/presentation/manager/splash_viewmodel.dart';
import 'package:tut/features/store_details/data/data_sources/store_details_remote_data_source.dart';
import 'package:tut/features/store_details/data/repositories/store_details_repository_impl.dart';
import 'package:tut/features/store_details/domain/repositories/store_details_repository.dart';
import 'package:tut/features/store_details/domain/use_cases/store_details_usecase.dart';
import 'package:tut/features/store_details/presentation/manager/store_details_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, it's a module where we put all generic dependencies

  // data sources
  // instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl()); // if we had a generic one
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(),
    );
    instance.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(instance()),
    );
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(),
    );
    instance.registerFactory<RegisterRepository>(
      () => RegisterRepositoryImpl(instance()),
    );
    instance.registerFactory<RegisterUseCase>(
      () => RegisterUseCase(instance()),
    );
    instance.registerFactory<RegisterViewModel>(
      () => RegisterViewModel(instance()),
    );
  }
}

void initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordRemoteDataSource>(
      () => ForgotPasswordRemoteDataSourceImpl(),
    );
    instance.registerFactory<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImpl(instance()),
    );
    instance.registerFactory<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(instance()),
    );
    instance.registerFactory<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel(instance()),
    );
  }
}

void initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    instance.registerFactory<StoreDetailsRemoteDataSource>(
      () => StoreDetailsRemoteDataSourceImpl(),
    );
    instance.registerFactory<StoreDetailsRepository>(
      () => StoreDetailsRepositoryImpl(instance()),
    );
    instance.registerFactory<StoreDetailsUseCase>(
      () => StoreDetailsUseCase(instance()),
    );
    instance.registerFactory<StoreDetailsViewModel>(
      () => StoreDetailsViewModel(instance()),
    );
  }
}

// These are simpler, maybe just register once or in app module
void initOnboardingModule() {
  if (!GetIt.I.isRegistered<OnboardingViewModel>()) {
    instance.registerFactory<OnboardingViewModel>(() => OnboardingViewModel());
  }
}

void initSplashModule() {
  if (!GetIt.I.isRegistered<SplashViewModel>()) {
    instance.registerFactory<SplashViewModel>(() => SplashViewModel());
  }
}

void initMainModule() {
  if (!GetIt.I.isRegistered<MainViewModel>()) {
    instance.registerFactory<MainViewModel>(() => MainViewModel());
  }
}
