import 'package:flutter/material.dart';
import 'package:union_shop/screens/product_page.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/screens/home_screen.dart';
import 'package:union_shop/screens/about_us_page.dart';
import 'package:union_shop/screens/collections_page.dart';
import 'package:union_shop/screens/collection_page.dart';
import 'package:union_shop/screens/sale_page.dart';
import 'package:union_shop/screens/login_page.dart';
import 'package:union_shop/screens/signup_page.dart';
import 'package:union_shop/screens/cart_page.dart';
import 'package:union_shop/screens/checkout_success_page.dart';
import 'package:union_shop/services/cart_service.dart';

class RouteLogger extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // ignore: avoid_print
    print('Navigator: push ${route.settings.name} from ${previousRoute?.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // ignore: avoid_print
    print('Navigator: pop ${route.settings.name} -> ${previousRoute?.settings.name}');
    super.didPop(route, previousRoute);
  }
}

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      notifier: CartService.instance,
      child: MaterialApp(
      title: 'Union Shop',
      navigatorObservers: [RouteLogger()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      
      initialRoute: '/',
      
      routes: { 
        '/about': (context) => const AboutUsPage(),
        '/cart': (context) => const CartPage(),
        '/checkout-success': (context) => const CheckoutSuccessPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/sale': (context) => const SalePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),

      },
   onGenerateRoute: (settings) {
          final name = settings.name ?? '';
          
          print('onGenerateRoute: name=$name args=${settings.arguments}');
          if (name.startsWith('/product/')) {
            final id = name.substring('/product/'.length);
            final args = settings.arguments;
            if (args is Product) {
              return MaterialPageRoute(
                settings: RouteSettings(name: settings.name, arguments: settings.arguments),
                builder: (_) => ProductPage(product: args, productId: id),
              );
            }
            return MaterialPageRoute(
              settings: RouteSettings(name: settings.name, arguments: settings.arguments),
              builder: (_) => ProductPage(productId: id),
            );
          }
          if (name.startsWith('/collection/')) {
            final id = name.substring('/collection/'.length);
            return MaterialPageRoute(
              settings: RouteSettings(name: settings.name, arguments: {'id': id}),
              builder: (_) => const CollectionPage(),
            );
          }
          return null;
        },
      ),
    );
  }
}


class CartProvider extends InheritedNotifier<CartService> {
  const CartProvider({super.key, required CartService notifier, required Widget child}) : super(notifier: notifier, child: child);

  static CartService of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CartProvider>();
    return provider!.notifier!;
  }
}

