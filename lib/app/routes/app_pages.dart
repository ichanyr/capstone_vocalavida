import 'package:get/get.dart';

import 'package:capstone_vocalavida/app/modules/home/artikulasi_detail/bindings/artikulasi_detail_binding.dart';
import 'package:capstone_vocalavida/app/modules/home/artikulasi_detail/views/artikulasi_detail_view.dart';
import 'package:capstone_vocalavida/app/modules/home/bindings/home_binding.dart';
import 'package:capstone_vocalavida/app/modules/home/intonasi_detail/bindings/intonasi_detail_binding.dart';
import 'package:capstone_vocalavida/app/modules/home/intonasi_detail/views/intonasi_detail_view.dart';
import 'package:capstone_vocalavida/app/modules/home/pernapasan_detail/bindings/pernapasan_detail_binding.dart';
import 'package:capstone_vocalavida/app/modules/home/pernapasan_detail/views/pernapasan_detail_view.dart';
import 'package:capstone_vocalavida/app/modules/home/resonansi_detail/bindings/resonansi_detail_binding.dart';
import 'package:capstone_vocalavida/app/modules/home/resonansi_detail/views/resonansi_detail_view.dart';
import 'package:capstone_vocalavida/app/modules/home/views/home_view.dart';
import 'package:capstone_vocalavida/app/modules/latihan/bindings/latihan_binding.dart';
import 'package:capstone_vocalavida/app/modules/latihan/views/latihan_view.dart';
import 'package:capstone_vocalavida/app/modules/latihan_detail/bindings/latihan_detail_binding.dart';
import 'package:capstone_vocalavida/app/modules/latihan_detail/views/latihan_detail_view.dart';
import 'package:capstone_vocalavida/app/modules/login/controllers/login_controller.dart';
import 'package:capstone_vocalavida/app/modules/login/views/login_view.dart';
import 'package:capstone_vocalavida/app/modules/main/views/main_view.dart';
import 'package:capstone_vocalavida/app/modules/onBoarding/bindings/on_boarding_binding.dart';
import 'package:capstone_vocalavida/app/modules/profile/bindings/profile_binding.dart';
import 'package:capstone_vocalavida/app/modules/profile/views/profile_view.dart';
import 'package:capstone_vocalavida/app/modules/register/bindings/register_binding.dart';
import 'package:capstone_vocalavida/app/modules/register/views/register_view.dart';
import 'package:capstone_vocalavida/app/modules/ujian_detail/bindings/ujian_detail_binding.dart';
import 'package:capstone_vocalavida/app/modules/ujian_detail/views/ujian_detail_view.dart';

import '../modules/main/controllers/main_controller.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainController());
      }),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN,
      page: () => LatihanView(),
      binding: LatihanBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnboardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_DETAIL,
      page: () => LatihanDetailView(),
      binding: LatihanDetailBinding(),
    ),
    GetPage(
      name: _Paths.PERNAPASAN_DETAIL,
      page: () => PernapasanDetailView(),
      binding: PernapasanDetailBinding(),
    ),
    GetPage(
      name: _Paths.RESONANSI_DETAIL,
      page: () => ResonansiDetailView(),
      binding: ResonansiDetailBinding(),
    ),
    GetPage(
      name: _Paths.ARTIKULASI_DETAIL,
      page: () => ArtikulasiDetailView(),
      binding: ArtikulasiDetailBinding(),
    ),
    GetPage(
      name: _Paths.INTONASI_DETAIL,
      page: () => IntonasiDetailView(),
      binding: IntonasiDetailBinding(),
    ),
    GetPage(
      name: _Paths.UJIAN_DETAIL,
      page: () => UjianDetailView(),
      binding: UjianDetailBinding(),
    ),
  ];
}
