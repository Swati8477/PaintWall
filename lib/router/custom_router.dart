import 'package:flutter/material.dart';
import 'package:PaintWall/pages/about_page.dart';
import 'package:PaintWall/pages/home_page.dart';
import 'package:PaintWall/pages/not_found_page.dart';
import 'package:PaintWall/pages/product_page.dart';
import 'package:PaintWall/pages/settings_page.dart';
import 'package:PaintWall/pages/shopleeper_login_signup.dart';
import 'package:PaintWall/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case productsRoute:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      case shopkeeperRoute:
        return MaterialPageRoute(builder: (_) => const ShopKeeper());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
