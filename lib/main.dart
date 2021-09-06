import 'package:flutter/material.dart';
import 'package:matbahk24/screen_examples.dart';

import 'package:matbahk24/theme.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/complete_accounte_screen.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/main_screens/sign_up/sign_up_screen.dart';
import 'package:matbahk24/ui/main_screens/splash_screen/splash_screen.dart';
import 'package:matbahk24/ui/main_screens/validate_number/validte_number_screen.dart';
import 'package:matbahk24/ui/mandoob/dialog_current_order/current_order_dialog.dart';
import 'package:matbahk24/ui/mandoob/home_mandop/home_mandop_screen.dart';
import 'package:matbahk24/ui/mandoob/traking_pages/TrakingMandop.dart';
import 'package:matbahk24/ui/mandoob/traking_pages/success_order/success_track.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/first_page.dart';
import 'package:matbahk24/ui/user/account_transfer/second_page/second_page.dart';
import 'package:matbahk24/ui/user/account_transfer/success_transfer/success_transfer.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/add_meal_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal2/add_meal2_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/add_meal3_screen.dart';
import 'package:matbahk24/ui/user/add_meal/successAddMeal/success_add_meal_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/ui/user/pages/best_claint/best_claint_screen.dart';
import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';
import 'package:matbahk24/ui/user/pages/category/category_screen.dart';
import 'package:matbahk24/ui/user/pages/completd_order/CompleteOrderScreen.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';
import 'package:matbahk24/ui/user/pages/home_user/home_user_screen.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ValidateNumberScreen.id: (context) => ValidateNumberScreen(),
        CompleteAccountScreen.id: (context) => CompleteAccountScreen(),
        HomeUserScreen.id: (context) => HomeUserScreen(),
        NavigationPage.id: (context) => NavigationPage(),
        BestClientsScreen.id: (context) => BestClientsScreen(),
        CategoryScreen.id: (context) => CategoryScreen(),
        DetailsClientScreen.id: (context) => DetailsClientScreen(),
        ProductDetailsScreen.id: (context) => ProductDetailsScreen(),
        CartScreen.id: (context) => CartScreen(),
        CompleteOrderScreen.id: (context) => CompleteOrderScreen(),
        AddMealScreen.id: (context) => AddMealScreen(),
        ScreenExamaples.id: (context) => ScreenExamaples(),
        AddMeal2Screen.id: (context) => AddMeal2Screen(),
        AddMeal3Screen.id: (context) => AddMeal3Screen(),
        SuccessAddMealScreen.id: (context) => SuccessAddMealScreen(),
        FirstPage.id: (context) => FirstPage(),
        SecondPage.id: (context) => SecondPage(),
        SuccessTransfer.id: (context) => SuccessTransfer(),
        HomeMandopScreen.id: (context) => HomeMandopScreen(),
        DailogCurrentOrder.id: (context) => DailogCurrentOrder(),
        TrakingMandop.id: (context) => TrakingMandop(),
          SuccessTracking.id: (context) => SuccessTracking()
      },
    );
  }
}
