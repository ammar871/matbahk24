import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/main_screens/sign_up/sign_up_screen.dart';
import 'package:matbahk24/ui/main_screens/splash_screen/splash_screen.dart';
import 'package:matbahk24/ui/main_screens/validate_number/validte_number_screen.dart';
import 'package:matbahk24/ui/user/add_market/first_page/first_page.dart';
import 'package:matbahk24/ui/user/add_market/success_transfer/success_transfer.dart';

import 'package:matbahk24/ui/user/add_meal/add_meal1/add_meal_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal2/add_meal2_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/add_meal3_screen.dart';
import 'package:matbahk24/ui/user/add_meal/successAddMeal/success_add_meal_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';

import 'package:matbahk24/ui/user/pages/sesrch_page/search_screen.dart';


import 'data/models/models_home/model_home.dart';


class AppRouter {
  final Foods food=Foods(food: Food(id: 1, name: "name", desc: "desc", attatchments: "attatchments", serveWay: "serveWay", notes: "notes", price: 23, persons: 33, preparationTime: 344,
      categoryId: 2, marketId: 1), photos: []);

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SplashScreen()
        );
      case login_screen:
        return MaterialPageRoute(
          builder: (_) =>
               LoginScreen(),

        );
      case otp_screen:
        return MaterialPageRoute(
          builder: (_) =>
              ValidateNumberScreen(code: "",phone: "",),
        );
      case signup_screen:
        return MaterialPageRoute(
          builder: (_) =>
              SignUpScreen(),
        );
      case navigation_screen:
        return MaterialPageRoute(
          builder: (_) =>
              NavigationPage(),
        );
      case search_screen:
        return MaterialPageRoute(
          builder: (_) =>
              SearchScreen(),
        );
      case cart_screen:
        return MaterialPageRoute(
          builder: (_) =>
              CartScreen(),
        );
      case trans_account1_screen:
        return MaterialPageRoute(
          builder: (_) =>
              FirstPage(),
        );
      case success_trans_account_screen:
        return MaterialPageRoute(
          builder: (_) =>
              SuccessTransfer(),
        );
      case  add_meal1_screen:
        return MaterialPageRoute(
          builder: (_) =>
              AddMealScreen(),
        );

      case  success_add_meal_screen:
        return MaterialPageRoute(
          builder: (_) =>
              SuccessAddMealScreen(),
        );


      default:
        return null;
    }
  }

}