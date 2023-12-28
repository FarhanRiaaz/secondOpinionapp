import 'package:second_opinion_app/models/categories/opinion_request.dart';
import 'package:second_opinion_app/ui/categories/categories.dart';
import 'package:second_opinion_app/ui/categories/questions.dart';
import 'package:second_opinion_app/ui/into/intro.dart';

import 'package:second_opinion_app/ui/login/login.dart';
import 'package:second_opinion_app/ui/filter/filter.dart';
import 'package:second_opinion_app/ui/my_user.dart';
import 'package:second_opinion_app/ui/payment/card_screen.dart';
import 'package:second_opinion_app/ui/payment/payment.dart';
import 'package:second_opinion_app/ui/profile/profile.dart';
import 'package:second_opinion_app/ui/registration/registration.dart';
import 'package:second_opinion_app/ui/second_opinion/doctors.dart';
import 'package:second_opinion_app/ui/second_opinion/payment_method.dart';
import 'package:second_opinion_app/ui/second_opinion/second_opinion.dart';
import 'package:second_opinion_app/ui/second_opinion/second_opinion_details.dart';
import 'package:second_opinion_app/ui/setting/setting.dart';
import 'package:second_opinion_app/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:second_opinion_app/ui/support/support.dart';

import '../../ui/change_password/change_password.dart';
import '../../ui/home_page_view/home_page_view.dart';
import '../../ui/notification/notification.dart';
import '../../ui/support/chat.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String profile = '/profile';
  static const String registration = '/registration';
  static const String addPayment = '/addPayment';
  static const String question = '/question';
  static const String intro = '/intro';
  static const String doctors = '/doctors';
  static const String setting = '/setting';
  static const String notification = '/notification';
  static const String second_opinion_detail = '/secondOpinionDetail';
  static const String upload_screen = '/upload';
  static const String payment_method = '/paymentMethod';
  static const String change_password = '/changePassword';
  static const String support = '/support';
  static const String filter = '/filter';
  static const String chat = '/chat';
  static const String myUsers = '/myUsers';
  static const String payment = '/payment';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => PageViewScreen(),
    categories: (BuildContext context) => CategoriesScreen(),
    profile: (BuildContext context) => ProfileScreen(),
    registration: (BuildContext context) => Registration(),
    addPayment: (BuildContext context) => AddPaymentScreen(),

    intro: (BuildContext context) => IntroScreen(),
    doctors: (BuildContext context) => DoctorsScreen(),
    setting: (BuildContext context) => SettingScreen(),
    notification: (BuildContext context) => NotificationScreen(),
    second_opinion_detail: (BuildContext context) => SecondOpinionDetailScreen(),
    upload_screen: (BuildContext context) => SecondOpinionScreen(opinionSubmitRequest: OpinionSubmitRequest(),),
    payment_method: (BuildContext context) => PaymentMethodScreen(),
    change_password: (BuildContext context) => ChangePasswordScreen(),
    support: (BuildContext context) => SupportScreen(),
    filter: (BuildContext context) => FilterScreen(),
    chat: (BuildContext context) => ChatScreen(),
    myUsers: (BuildContext context) => MyUsers(),
    payment: (BuildContext context) => PaymentScreen(),


  };
}
