import 'package:get/get.dart';
import 'package:kannada_devangar/bindings/welcome_binding.dart';
import 'package:kannada_devangar/utility/app_routers.dart';
import 'package:kannada_devangar/views/aadhar_image_screen.dart';
import 'package:kannada_devangar/views/feedback_screen.dart';
import 'package:kannada_devangar/views/help_page.dart';
import 'package:kannada_devangar/views/horoscope_image_screen.dart';
import 'package:kannada_devangar/views/login_screen.dart';
import 'package:kannada_devangar/views/login_screen_new.dart';
import 'package:kannada_devangar/views/my_profile_view.dart';
import 'package:kannada_devangar/views/myprofile_screen.dart';
import 'package:kannada_devangar/views/order_screen.dart';
import 'package:kannada_devangar/views/partner_pref_screen.dart';
import 'package:kannada_devangar/views/payment_screen.dart';
import 'package:kannada_devangar/views/profile_image_screen.dart';
import 'package:kannada_devangar/views/register_screen.dart';
import 'package:kannada_devangar/views/search_screen.dart';
import 'package:kannada_devangar/views/unlocked_profile_screen.dart';
import 'package:kannada_devangar/views/welcome_screen.dart';
import 'package:kannada_devangar/views/home_screen.dart';

import 'package:kannada_devangar/bindings/auth_binding.dart';
import 'package:kannada_devangar/views/yourmatch_screen.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;
  static final routes = [
    GetPage(
        name: Routes.welcomeView,
        page: () => WelcomeScreen(),
        binding: WelcomeBinding()),
    /*GetPage(
        name: Routes.loginview,
        page: () => LoginScreen(),
        binding: AuthBinding()),*/
    GetPage(
        name: Routes.loginview,
        page: () => MemberLoginScreen(),
        binding: AuthBinding()),
    GetPage(name: Routes.registerView, page: () => RegisterScreen()),
    GetPage(name: Routes.homeView, page: () => HomeScreen()),
    //GetPage(name: Routes.myProfileView, page: () => MyProfileScreen()),
    GetPage(name: Routes.myProfileView, page: () => MyProfileView()),
    GetPage(name: Routes.partnerprefView, page: () => PartnerPref_Screen()),
    GetPage(name: Routes.yourmatchView, page: () => Yourmatch_Screen()),
    GetPage(name: Routes.searchView, page: () => Search_Screen()),
    GetPage(name: Routes.paymentView, page: () => PaymentScreen()),
    GetPage(name: Routes.ordersView, page: () => Order_Screen()),
    GetPage(name: Routes.profileimage, page: () => ProfileImageScreen()),
    GetPage(name: Routes.horoscopeimage, page: () => HoroscopeImageScreen()),
    GetPage(name: Routes.aadharimage, page: () => AadharImageScreen()),
    GetPage(name: Routes.unlockedprofileView,page: () => Unlocked_Profile_Screen()),
    GetPage(name: Routes.feedback_share,page: () => FeedbackShareScreen()),
    GetPage(name: Routes.help_page,page: () => HelpPage()),
  ];
}
