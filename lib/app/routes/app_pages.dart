import 'package:get/get.dart';

import '../modules/bank_registration/bindings/bank_registration_binding.dart';
import '../modules/bank_registration/views/bank_registration_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/income/bindings/income_binding.dart';
import '../modules/income/views/income_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/password/bindings/password_binding.dart';
import '../modules/password/views/password_view.dart';
import '../modules/password_login/bindings/password_login_binding.dart';
import '../modules/password_login/views/password_login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/set_up_profile/bindings/set_up_profile_binding.dart';
import '../modules/set_up_profile/views/set_up_profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/vehicle_registration/bindings/vehicle_registration_binding.dart';
import '../modules/vehicle_registration/views/vehicle_registration_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD,
      page: () => const PasswordView(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: _Paths.SET_UP_PROFILE,
      page: () => const SetUpProfileView(),
      binding: SetUpProfileBinding(),
    ),
    GetPage(
      name: _Paths.VEHICLE_REGISTRATION,
      page: () => const VehicleRegistrationView(),
      binding: VehicleRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.BANK_REGISTRATION,
      page: () => const BankRegistrationView(),
      binding: BankRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_LOGIN,
      page: () => const PasswordLoginView(),
      binding: PasswordLoginBinding(),
    ),
    GetPage(
        name: _Paths.DASHBOARD_PAGE,
        page: () => const DashboardPageView(),
        binding: DashboardPageBinding(),
        bindings: [HomeBinding(), IncomeBinding()]),
    GetPage(
      name: _Paths.INCOME,
      page: () => const IncomeView(),
      binding: IncomeBinding(),
    ),
  ];
}
