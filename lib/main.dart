import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/bussincc_logic/providers/market/add_market_provider/add_market_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/add_meal_provider/add_meal_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/add_to_cart/add_cart_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/auth_providers/sing_up_divder_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/get_carts_provider/get_carts_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/markets_provider/markets_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/search_provider/search_provider.dart';
import 'package:matbahk24/bussincc_logic/providers/user/update_cart_provider/update_cart_provider.dart';


import 'package:matbahk24/theme.dart';

import 'package:provider/provider.dart';

import 'app_router.dart';
import 'bussincc_logic/providers/upload_image/upload_image.dart';
import 'bussincc_logic/providers/user/auth_providers/complete_provider.dart';
import 'bussincc_logic/providers/user/auth_providers/login_provider.dart';
import 'bussincc_logic/providers/user/auth_providers/otp_provider.dart';
import 'bussincc_logic/providers/user/auth_providers/providers_validate_number.dart';
import 'bussincc_logic/providers/user/home_providers/home_providers.dart';
import 'bussincc_logic/providers/user/market_detail_provider/market_details_provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
          ChangeNotifierProvider<OtpProvider>(create: (_) => OtpProvider()),
          ChangeNotifierProvider<SignValidateProvider>(
              create: (_) => SignValidateProvider()),
          ChangeNotifierProvider<CompletedAccountProvider>(
            create: (_) => CompletedAccountProvider(),
          ),
          ChangeNotifierProvider<HomeProviders>(create: (_) => HomeProviders()),
          ChangeNotifierProvider<MarketsProvider>(create: (_) => MarketsProvider()),
          ChangeNotifierProvider<MarketDetailsProvider>(create: (_) => MarketDetailsProvider()),
          ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
          ChangeNotifierProvider<AddCartProvider>(create: (_) => AddCartProvider()),
          ChangeNotifierProvider<GetCartProvider>(create: (_) => GetCartProvider()),
          ChangeNotifierProvider<UpdateCartProvider>(create: (_) => UpdateCartProvider()),
          ChangeNotifierProvider<UploadImageMarketProvider>(create: (_) => UploadImageMarketProvider()),
          ChangeNotifierProvider<AddMarketProvider>(create: (_) => AddMarketProvider()),
          ChangeNotifierProvider<SignDriverProvider>(create: (_) => SignDriverProvider()),
          ChangeNotifierProvider<AddMealProvider>(create: (_) => AddMealProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: _router.onGenerateRoute,
        ));
  }
}
