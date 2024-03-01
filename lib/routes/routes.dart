import 'package:car_soare_parts_app/bindings.dart';
import 'package:car_soare_parts_app/modules/main/basket/basket_list_page.dart';
import 'package:car_soare_parts_app/modules/main/basket/start_payment_page.dart';
import 'package:car_soare_parts_app/modules/main/drawer/about_us_page.dart';
import 'package:car_soare_parts_app/modules/main/home/home_widget_list_page.dart';
import 'package:car_soare_parts_app/modules/main/main_binding.dart';
import 'package:car_soare_parts_app/modules/main/main_page.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/order_binding.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/order_list_page.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/order_single_page.dart';
import 'package:car_soare_parts_app/modules/main/profile/user_info_edit_page.dart';
import 'package:car_soare_parts_app/modules/main/profile/user_info_page.dart';
import 'package:car_soare_parts_app/modules/product/comment/comment_page.dart';
import 'package:car_soare_parts_app/modules/product/page/filter_product_page.dart';
import 'package:car_soare_parts_app/modules/product/page/product_list_page.dart';
import 'package:car_soare_parts_app/modules/product/page/product_single_page.dart';
import 'package:car_soare_parts_app/modules/product/product_binding.dart';
import 'package:car_soare_parts_app/modules/register/pages/login_page.dart';
import 'package:car_soare_parts_app/modules/register/pages/register_page.dart';
import 'package:car_soare_parts_app/modules/search/search_page.dart';
import 'package:car_soare_parts_app/modules/splash/splash_page.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: NamePages.splashPage,
    page: () => SplashPage(),
  ),
  GetPage(
    name: NamePages.loginPage,
    page: () => LoginPage(),
  ),
  GetPage(
    name: NamePages.registerPage,
    page: () => RegisterPage(),
  ),
  GetPage(
    name: NamePages.mainPage,
    page: () => MainPage(),
    bindings: [
      MainBinding(),
    ],
  ),
  GetPage(
    name: NamePages.productSinglePage,
    page: () => ProductSinglePage(),
    //binding: ProductBinding(),
  ),
  GetPage(
    name: NamePages.basketListPage,
    page: () => BasketListPage(),
  ),
  GetPage(
    name: NamePages.userInfoPage,
    page: () => UserInfoPage(),
  ),
    GetPage(
    name: NamePages.searchPage,
    page: () => SearchPage(),
    binding: SearchBinding()
  ),
  GetPage(
    name: NamePages.userInfoEditPage,
    page: () => const UserInfoEditPage(),
  ),
  GetPage(
      name: NamePages.orderListPage,
      page: () => OrderListPage(),
      bindings: [
        OrderBinding(),
      ]),
  GetPage(
    name: NamePages.orderSinglePage,
    page: () => OrderSinglePage(),
  ),
  GetPage(
    name: NamePages.commentPage,
    page: () => CommentPage(),
  ),
  GetPage(
      name: NamePages.productListPage,
      page: () => ProductListPage(),
      binding: ProductBinding()),
  GetPage(
    name: NamePages.homeWidgetListPage,
    page: () => HomeWidgetListPage(),
  ),
  GetPage(
    name: NamePages.aboutUsPage,
    page: () => const AboutUsPage(),
  ),
  GetPage(
    name: NamePages.filterProductPage,
    page: () => FilterProductPage(),
  ),
  GetPage(
    name: NamePages.startPaymentPage,
    page: () => StartPaymentPage(),
  ),
];
