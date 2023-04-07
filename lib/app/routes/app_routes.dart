import 'package:get/get.dart';
import 'package:hypertension/app/bindings/01_splash_bindings/splash_binding.dart';
import 'package:hypertension/app/bindings/02_login_bindings/login_binding.dart';
import 'package:hypertension/app/bindings/03_otp_bindings/otp_binding.dart';
import 'package:hypertension/app/bindings/04_user_signup_bindings/user_signup_binding.dart';
import 'package:hypertension/app/routes/names_routes.dart';
import 'package:hypertension/app/ui/pages/01_splash_screen/splash_screen.dart';
import 'package:hypertension/app/ui/pages/02_login_screen/login_screen.dart';
import 'package:hypertension/app/ui/pages/03_otp_screen/otp_screen.dart';
import 'package:hypertension/app/ui/pages/04_user_signup_screen/user_signup_screen.dart';
import 'package:hypertension/app/ui/pages/05_hompage_screen/homepage_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: NameRoutes.splashScreen,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
          title: 'Splash Screen',
        ),
        GetPage(
          name: NameRoutes.loginScreen,
          page: () => const LoginScreen(),
          title: 'login Screen',
          binding: LoginBindings(),
        ),
        GetPage(
          name: NameRoutes.otpScreen,
          page: () => const OtpScreen(),
          title: 'OTP Screen',
          binding: OtpBinding(),
        ),
        GetPage(
          name: NameRoutes.userSignup,
          page: () => const UserSignupScreen(),
          title: 'OTP Screen',
          binding: UserSignupBinding(),
        ),
        GetPage(
          name: NameRoutes.homepageScreen,
          page: () => const HomepageScreen(),
          title: 'Homepage Screen',
        ),
      ];
}
