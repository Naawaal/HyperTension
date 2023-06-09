import 'package:get/get.dart';
import 'package:hypertension/app/bindings/01_on_boarding_bindings/splash_binding.dart';
import 'package:hypertension/app/bindings/02_login_bindings/login_binding.dart';
import 'package:hypertension/app/bindings/03_otp_bindings/otp_binding.dart';
import 'package:hypertension/app/bindings/04_user_signup_bindings/user_signup_binding.dart';
import 'package:hypertension/app/bindings/05_homepage_bindings/01_daily_check_bindings/daily_check_binding.dart';
import 'package:hypertension/app/bindings/05_homepage_bindings/05_view_report_bindings/view_report_binding.dart';
import 'package:hypertension/app/bindings/05_homepage_bindings/homepage_binding.dart';
import 'package:hypertension/app/routes/names_routes.dart';
import 'package:hypertension/app/ui/pages/01_on_boarding_screen/splash_screen.dart';
import 'package:hypertension/app/ui/pages/02_login_screen/login_screen.dart';
import 'package:hypertension/app/ui/pages/03_otp_screen/otp_screen.dart';
import 'package:hypertension/app/ui/pages/04_user_signup_screen/user_signup_screen.dart';
import 'package:hypertension/app/ui/pages/05_hompage_screen/homepage_screen.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/01_daily_check_screen/daily_check_screen.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/02_diet_plans_screen/diet_plan_screen.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/04_about_hypertension_screen/about_hypertension._screen.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/05_view_report_screen/view_report_screen.dart';
import 'package:hypertension/app/ui/pages/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: NameRoutes.splashScreen,
          page: () => const SplashScreen(),
          binding: OnBoardingBinding(),
          title: 'Splash Screen',
          transition: Transition.cupertinoDialog,
        ),
        GetPage(
          name: NameRoutes.onBoardingScreen,
          page: () => OnBoardingScreen(),
          binding: OnBoardingBinding(),
          title: 'onBoarding Screen',
          transition: Transition.cupertinoDialog,
        ),
        GetPage(
          name: NameRoutes.loginScreen,
          page: () => const LoginScreen(),
          title: 'login Screen',
          binding: LoginBindings(),
          transition: Transition.leftToRightWithFade,
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
          title: 'User SignUp Screen',
          binding: UserSignupBinding(),
        ),
        GetPage(
          name: NameRoutes.homepageScreen,
          page: () => const HomepageScreen(),
          title: 'Homepage Screen',
          binding: HomepageBinding(),
        ),
        GetPage(
          name: NameRoutes.dailyCheck,
          page: () => const DailyCheckScreen(),
          title: 'DailyCheck Screen',
          binding: DailyCheckBinding(),
        ),
        GetPage(
          name: NameRoutes.viewReport,
          page: () => ViewReportScreen(),
          title: 'ViewReport Screen',
          binding: ViewReportBinding(),
        ),
        GetPage(
          name: NameRoutes.aboutHyperTension,
          page: () => const AboutHyperTensionScreen(),
          title: 'About Hyper Tension Screen',
        ),
        GetPage(
          name: NameRoutes.dietPlan,
          page: () => const DietPlanScreen(),
        )
      ];
}
