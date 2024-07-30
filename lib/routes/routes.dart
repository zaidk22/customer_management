import 'package:customer_management/presentation/pages/add_edit_customer/bindings/add_customer_binding.dart';
import 'package:customer_management/presentation/pages/add_edit_customer/views/add_customer_page.dart';
import 'package:customer_management/presentation/pages/home/bindings/homebindings.dart';
import 'package:customer_management/presentation/pages/home/views/home.dart';
import 'package:customer_management/presentation/splash/bindings/splash_bindings.dart';
import 'package:customer_management/presentation/splash/views/splash_page.dart';
import 'package:customer_management/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesNames.splashScreen,
          page: () => const SplashPage(),
          binding: SplashBindings(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RoutesNames.homeScreen,
          page: () => const HomePage(),
          binding: Homebindings(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RoutesNames.addCustomerScreen,
          page: () => AddCustomerPage(),
          binding: AddCustomerBinding(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
      ];
}
